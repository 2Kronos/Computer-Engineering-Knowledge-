
# Ch 13.1 Data Transmission media
### Wire Connections
- **Capacity**: Low data capacity.
- **Installation Difficulty**: Easy to install.
- **Cost**: Low.

### Coaxial copper Cable
- **Capacity**: Moderate data capacity (up to 1 GHz). High
- **Installation Difficulty**: Easy
- **Cost**: Moderate.

### Twisted Pair Cable (UTP/STP)
- **Capacity**: Low to moderate data capacity (up to 1 MHz).
- **Installation Difficulty**: Easy to install.
- **Cost**: Low.

### Optical Fiber Cable
- **Capacity**: Very high data capacity (up to 100 GHz+).
- **Installation Difficulty**: Hard to install due to precision requirements.
- **Cost**: low.

### Wireless Transmission
- **Capacity**: Varies widely; can be high depending on technology.
- **Installation Difficulty**: Easy to install, but requires careful planning for coverage.
- **Cost**: Moderate to high depending on infrastructure.

# Ch 13.2 Methods and modes for data transmission


### Serial Data Transmission
- **Transmission Method**: Data transmitted one bit at a time in a bit stream.
- **Data Rate**: Typically slower than parallel.
- **Advantage**: More reliable for long-distance transmission, reducing errors.
- **Use Cases**: Commonly used for connections like USB and long-distance data transmission.

### Parallel Data Transmission
- **Transmission Method**: Data transmitted several bits at a time on separate lines.
- **Data Rate**: Faster than serial transmission.
- **Advantage**: Higher data rates for short distances.
- **Use Cases**: Used within computers, such as for internal data processing.

### Conversion Between Serial and Parallel
- **Conversion**: Serial-to-parallel and parallel-to-serial conversions are essential in data transmission systems.
- **Components**: Shift registers are used for conversion, facilitating communication between different data formats.
### Asynchronous Transmission
- Data are sent in short bursts known as packets.
  
- A data packet consists of data bits representing characters, a parity bit, and start/stop bits.
  
- There is a pause between data packets so the receiver recognizes the start bit that precedes each packet.
  
- At the end of the data packet, one or more stop bits signal the receiver that the packet is complete.
  
- Sending and receiving devices operate with separate oscillators with the same clock frequency.
  
- Clock frequencies may drift over time, so they are typically re-synchronized on each data packet with the start bit.
  
- Data packets usually contain 10 or 11 bits, with eight bits carrying the information.
  
- Between packets, there is a `continuous logic level when the channel is idle.
- `A data packet begins with a start bit that has the opposite logic level as the idle period to alert the receiver that a packet is starting.
- `A parity bit follows the data bits, and a stop bit signals the end of the packet.

### Synchronous Transmission
- Both the sender and receiver derive timing from the same clock signal, originating at the sender.
  
- Bits are transmitted in a continuous stream with no pauses, requiring the receiver to recognize where a data block starts and ends.
  
- The receiver must determine the timing information to synchronize with the transmitter.
  
- Synchronous transmission is generally faster than asynchronous transmission.
  
- RZ (return to zero) and NRZ (nonreturn to zero) formats are data formats requiring separate data and timing channels.
  
- In the RZ format, a single pulse during a bit time represents a 1, and the absence of a pulse represents a 0.
  
- In the NRZ format, a high level represents a 1, and a low level represents a 0 during a bit time.
  
- Manchester encoding embeds the timing signal in the data, requiring only one channel.
  
- A rising edge in Manchester encoding represents a 1, and a falling edge represents a 0, with edges occurring at the middle of the bit time.
  
- The clock is extracted from the data with a phase-locked loop, allowing synchronization.

- Uses a XNOR GATE (High when both same logic level)

### Synchronous Frames
Synchronous data are sent in frames that include other bits

- **Preamble**: 
- **Address Fields**: 
- **Control Field**: 
- **Data Field**: 
- **Frame Check**: 
- **End Frame**: Group of bits signaling the receiver that the end of the frame has been reached.
![[Pasted image 20240903234720.png]]
## Transmission effeciency
![[Pasted image 20240904000227.png]]

![[Pasted image 20240904000344.png]]

## Data rates  

Here are the important points:

- **Data Rate**: Speed of data transfer.
- **Bit Rate**: Number of bits (1s and 0s) per second (bps); preferred measure.
- **Baud**: Symbol rate or number of data symbols (transitions/events) per second.
- **Relationship**: Bit rate is always greater than or equal to the baud.
    - **Formula**:
        ![[Pasted image 20240904163030.png]]

![[Pasted image 20240904163104.png]]
## Transmission Modes

- **Simplex Mode**: Data flows in only one direction, from sender to receiver (e.g., from a computer to a printer).
  
- **Half-Duplex Mode**: Data flows in both directions but not at the same time. The sender transmits, then the receiver responds (e.g., walkie-talkies).
  
- **Full-Duplex Mode**: Data flows both ways simultaneously in the same channel, with the bandwidth divided between the two directions (e.g., phone conversations).

# Ch 13.3 Modulation of Anolog signals with  Digital data

## Amplitude shift keying 

- **Amplitude-shift keying (ASK)** is a modulation technique where a digital signal varies the amplitude of a higher frequency sine wave (carrier).
- In its simplest form, ASK is also known as **on-off keying (OOK)**, where the carrier signal is turned on and off by the data signal.
- **Binary representation**: Carrier on = binary 1, Carrier off = binary 0.

- **Common use**: ASK is most commonly used in fiber optics, where the presence of light represents a binary 1 and the absence of light represents a binary 0.
  
- **Binary amplitude-shift keying (BASK)**: When modulated by digital data (1s and 0s), ASK is sometimes referred to as BASK.

### Frequency-Shift Keying (FSK)

- **Modulation Type**: Digital signal modulates the frequency of a higher frequency sine wave (carrier).
- **Binary Representation**: Lower frequency = binary 0, Higher frequency = binary 1.
- **Alternate Name**: Sometimes known as binary frequency-shift keying (BFSK).

### Phase-Shift Keying (PSK)

- **Modulation Type**: Digital signal modulates the phase of a higher frequency sine wave.
- **Binary Representation**: One phase = binary 1, 180° out-of-phase = binary 0.

## Quadrature Amplitude Modulation


- **Quadrature Amplitude Modulation (QAM)**: Combines PSK and ASK to send information.
- **Quadrature**: Refers to a 90° phase difference.
- **Modulation State/Symbol**: Each combination of phase and amplitude represents a combination of two or more bits.
- **8-QAM**: Uses eight modulation states to represent unique three-bit combinations.
- **Amplitude and Phase Combinations**: Two different amplitudes with a quadrature phase difference between each pair, resulting in eight different amplitude/phase combinations.
- **M-QAM Variations**: Higher M values like 16-QAM, 64-QAM, and 256-QAM use more amplitude levels and/or phases to represent larger bit groups (e.g., 64-QAM can represent 6-bit groups, 256-QAM can represent 8-bit groups).

## Constilation Maps

- The axis are phase changes(PSK)
- The distance from the amplitude is amplitude (ASK)

![[Pasted image 20240904162219.png]]

In the example the below there is only a phase shift it is  4-PSK(4 possible phases)

![[Pasted image 20240904162719.png]]
- 4-PSK can also be drawn as below this just means none of them on in phase with the 0 degree carrier. Still in the same the same phase

![[Pasted image 20240904163350.png]]

- The drawing below has 4 phase
- 2 different amplitudes
- 8 signals
- Combination of phase change and amplitude change 
- This is called a <u> 8-QAM </u> due to the combination

![[Pasted image 20240904163719.png]]

- Drawing below has 16 states
- The red ones are on the same phase(Same radio line) but different amplitudes
- The blue one have the same amplitude(Distance from the center )
- This is 16-QAM
 ![[Pasted image 20240904164636.png]]

# Ch 13-4 Modulation od digital Signals with analog Data

## Pulse Width Modulation

- **Pulse Width Modulation (PWM)**: Varies the width or duration of pulses and duty cycle according to the modulating analog signal.
- **Applications**: Commonly used in control applications such as braking systems, motor speed control, and renewable energy systems.
- **Intersective Method**: Uses a sawtooth or triangular waveform to generate PWM.
- **Operation**: The sawtooth waveform intersects the sinusoidal modulating signal twice per cycle, creating pulses with widths proportional to the amplitude of the sine wave.
- **Implementation**: Can be implemented with a sawtooth or triangular wave generator and a comparator.
## Pulse width Modulation

- **Pulse Code Modulation (PCM)**: Involves sampling an analog signal amplitude at regular intervals and converting the sampled values to a digital code.
- **Sampling**: The analog signal is sampled at fixed intervals, and the sampled value is held until the next sample.
- **Binary Representation**: Each sampled value is converted to a 3-bit binary number, creating a pulse sequence where each pulse represents a 1 and the absence of a pulse represents a 0.
- **Accuracy**: Higher sampling rates and more levels result in a more accurate PCM representation.
- **Applications**: Used in digital audio (computers, Blu-ray, CD, DVD) and digital telephone systems.

![[Pasted image 20240904170748.png]]

- If given analog wave form know how to convert to the digital wave form

# CH13-5 Multiplexing and Demultiplexing

## Time-Division multiplexing

- **Time-Division Multiplexing (TDM)**: Technique where data from several sources are interleaved on a time basis and sent on a single communication channel or data link.
- **Time Slots**: Specific time slots are allotted for each data source.
- **Data Transmission**: Data from each source is sent in its respective time slot in a repeating cycle until all data is transmitted.
- **Multiplexing and Demultiplexing**: Multiple data sources are switched (multiplexed) in a time sequence onto a single line and then switched back (demultiplexed) onto multiple lines in a synchronized time sequence.

<u> Picture below</U>

- Data on the incoming streams are changing at a certian rain counter must sample them before they change 
- Counter takes out the bit one at a time
![[Pasted image 20240904172644.png]]

## 13-6 Bus basics

- One of the device can put volatge on the wire and the others can just read the data off
- The wire is called a bus
- In the below this is a serial bus (from one device to all the other devices) there are mechanism that  will choose which device pust data on the bus 

