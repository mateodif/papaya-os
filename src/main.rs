#![no_main]
#![no_std]

use core::{panic::PanicInfo, arch::asm};

#[no_mangle]
pub extern "C" fn abort() -> ! {
	loop {
		unsafe {
			asm!("wfi");
		}
	}
}		

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
	abort();
}

#[no_mangle]
pub extern "C" fn start() {
    panic!();
}
