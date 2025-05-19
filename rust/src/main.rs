use scraper::{Html, Selector};
use std::fs;
use peak_alloc::PeakAlloc;

#[macro_use]
extern crate timeit;

#[global_allocator]
static PEAK_ALLOC: PeakAlloc = PeakAlloc;

fn main() {
    let html = fs::read_to_string("../amazon.com.html").unwrap();
    timeit!({
        let document = Html::parse_document(&html);
        let selector = Selector::parse("h2").unwrap();
        let h1s = document.select(&selector);
        for h1 in h1s {
            let text = h1.text().collect::<Vec<_>>();
            println!("{:?}", text);
        };
    	let peak_mem = PEAK_ALLOC.peak_usage_as_mb();
    	println!("The max amount that was used {} MB", peak_mem);
	});
}
