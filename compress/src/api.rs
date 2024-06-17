pub fn compress_mozjpeg(image: Vec<u8>, width: usize, height: usize, quality: f32) -> Vec<u8> {
    let result = std::panic::catch_unwind(|| -> std::io::Result<Vec<u8>> {
        let d = mozjpeg::Decompress::new_mem(image.as_slice())?;
        let mut image = d.rgb()?;
        let pixels = image.read_scanlines()?;

        let mut comp = mozjpeg::Compress::new(mozjpeg::ColorSpace::JCS_RGB);
        comp.set_size(width, height);
        comp.set_quality(quality);
        let mut comp = comp.start_compress(Vec::new())?;
        comp.write_scanlines(&pixels[..])?;

        let writer = comp.finish()?;
        Ok(writer)
    });

    if let Ok(result) = result {
        if let Ok(result) = result {
            return result;
        }
    }
    Vec::new()
}
