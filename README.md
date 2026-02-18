# ARM-Timer-Interrupt-LED-Controller

## Overview
This project configures Timer2A on a TM4C microcontroller to generate 
1-second periodic interrupts using a 16 MHz system clock.

An Interrupt Service Routine (ISR) cycles through RGB LED states 
on Port F using memory-mapped register control.

## Features
- 32-bit periodic timer configuration
- NVIC interrupt enable (Interrupt #23)
- Interrupt-driven LED state machine
- ARM assembly implementation
- Direct register-level programming

## Technical Concepts
- Timer peripheral configuration
- Interrupt handling
- NVIC configuration
- GPIO register manipulation
- Memory-mapped I/O

## Author
Caleb Byers

