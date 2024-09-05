# Ch 14-1


- the CPU consists of four separate units: the arithmetic logic unit (ALU), the instruction decoder, the timing and control unit, and the register set.

- system bus, which consists of three component buses: the address bus, the data bus, and the control bus.
# CH 14-2
- The issue of inputs affecting the performance of an output to which they are con nected is called signal loading.

- A buffer is a special circuit that isolates the output of a device from the loading effects of other devices.

- A wait state holds the state of the bus signals for one processor clock cycle so that the read or write operation is “frozen” for one clock period when the processor is accessing memory or other devices that are slow to respon
- **Bus contention **When the outputs of two or more devices connect to the same signal line, the potential for bus contention exists. Bus contention occurs when device outputs attempt to drive a signal line to different voltage levels.

# CH 14-3

- During the fetch phase, an instruction is read from the memory and decoded by the instruction decoder. During the execute phase, the processor carries out the sequence of operations called for by the instruction

- A technique where the microprocessor begins executing the next instruction in a program before the previous instruction has been completed is called pipelining

- Processor elements  
	- ALU 
	- Instruction decoder 
	- Timing/Control unit
	- Register set

- Role of CPU 
	- Control system hardware
	- Support Operating system software 
	- Execute Application programs 

# Ch 14-4 Addressing Modes


# interupts and polling 

Interrupts and polling are two methods for a hardware device to get the CPU’s attention.

- **Interrupts**: The device notifies the CPU when it needs attention.
- **Polling**: The CPU regularly checks the device’s status to see if it needs attention.

## What is an interrupt 
- **Interrupt Definition**: An interrupt is a signal that prompts the CPU to immediately execute a specific routine required by an external hardware device.
    
- **Timer Device Example**:
    
    - **Regular Interrupts**: A timer device sends regular interrupts to indicate that a certain time period has elapsed.
    - **CPU Offloading**: This process offloads the task of tracking time from the CPU.
    - **Interrupt Service Routine (ISR)**: Upon receiving the interrupt, the CPU executes an ISR to update the system clock or refresh the computer screen.

- **Interrupt Handling Process**:
    
    - **Task Pausing**: When an interrupt occurs, the CPU pauses the task it is currently executing.
    - **ISR(interup Inservice routine ) Execution**: The CPU then executes the ISR corresponding to the interrupting hardware device.
    - **Task Resumption**: After handling the interrupt, the CPU resumes the task it was performing before the interrupt occurred.

### Hardware and Software interupt

#### Hardware interupt

- **Hardware Interrupt**: An external hardware device signals the CPU for attention.
    
    - **Example**: Pressing a key on the keyboard triggers a hardware interrupt, causing the CPU to read the keystroke.
    - **Interrupt Request (IRQ)**: The signal initiating a hardware interrupt, applied to the IRQ pin of a microprocessor.
- **Peripheral Interrupt Controller (PIC)**:
    - Manages IRQ signals from multiple hardware devices.
    - Outputs a single IRQ signal and an interrupt number to the CPU.
    - The CPU reads the interrupt number to identify the device needing attention and executes the corresponding Interrupt Service Routine (ISR).
      
- **Types of Hardware Interrupts**:
    - **Maskable Interrupt**: Can be disabled by the CPU during critical tasks.
    - **Non-Maskable Interrupt**: Cannot be disabled, used for urgent situations like critically low battery power.
      
- **Interrupt Handling**:
    - **Maskable Interrupts**: Disabled during critical tasks and re-enabled afterward.
    - **Non-Maskable Interrupts**: Always enabled to handle urgent situations.

#### Software interrupt 

Sure, here are the key points in bullet form:

- A software interrupt, also known as an exception, is caused by an exceptional condition within the CPU.
- Examples of exceptions include:
    - Dividing a number by zero, which causes a divide by zero exception.
    - Attempting to access a memory location outside the allowable address range, causing a memory access exception.
- When an exception occurs, the CPU:
    - Aborts the current task that caused the exception.
    - Executes a specific Interrupt Service Routine (ISR) to handle the situation and determine the next steps.

## Poling

- **Polling** is a software routine where the CPU regularly checks if a hardware device needs attention.
- Commonly used with input/output (I/O) devices, hence also called **polled I/O** or **software-driven I/O**.
- **Example**: A printer is regularly checked by a print service routine to see if it is ready to receive more data.
- The operating system executes the print service routine at regular intervals.
- This method is not interrupt-driven I/O because it is not urgent, making it suitable for synchronous handling by the operating system.
  
## Main difference

- Interrupts notify the CPU when attention is needed, while polling involves the CPU regularly checking device status.
-  Interrupts are asynchronous, while polling is synchronous.
-  Efficiency depends on how often and how urgently a hardware device needs attention.