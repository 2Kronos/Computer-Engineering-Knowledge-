# 1.1. Digital Technology and Applications [Page 56]

1. **Sampling Frequency**: How to determine the sampling Frequency, Which follows the nyquist rule that states that for a signal $f(x)$, with a frequency $f$, The minimum frequency required to sample this signal reliably is 
   $f_s \geq 2 \times f$ (f = 15  must still verify)

2. **Baseband Modulation**
   - Explain what is Baseband

- Baseband transmission can only achieve low data rate s 
-  Baseband  is PWM, PPM, PCM

   - Modulation - Pulse Width Modulation (PWM), Pulse Amplitude Modulation(PAM), Pulse Code Modulation(PCM), Pulse Position Modulation(PPM)
   - Note:
     - Pulse Amplitude Modulation has poor Noise Immunity (Will discuss this deeper later),
     - The order, from least to highest noise immunity is Pulse Amplitude Modulation → Pulse Width Modulation → Pulse Position → Pulse Code Modulation
     - Know that they are different methods 

3. **Broadband Modulation** (BBM)
   - Explain what is Broadband Modulation in data techniques
   - 4PSK 8 PSK, 16 PSK Limit being  for  PSK 16, Phase Shift Keying
   - Quadrature Amplitude Modulation - 4 QAM, 8QAM, 16 QAM & 32 QAM
   - Explain the difference in these data modulation techniques.
   - If you want to achieve broadband speed we have to you BBM Techniques 
     
<u> What is the distinguishing factor between broadband modulation techniques as constilation </u>

   - Inter-symbol interference, ISI - Leading to beats being corrupted
   - For PSK there is higher ISI in 8psk than 4 psk 

<u>Why can't we move above 16 PSK</u>,
 - It is due the fact that symbols are now so close to each other the distance is so small that for you to dectect each of them the reciever complexity increases that why QAM
   was introduced 
   
<u>why was QAM designed to solve PSK.</u>

	- In QAM the distance between symbols is greater makes QAM less susceptible to ISI 
	- Be able to draw the constellation diagram for both QAM & PSK.
	  
## In addition, discuss and demonstrate understanding of applications of either technologies in a given scenario and context

- PCM is used in telephones 
- PWM is used in motor control 

<u> if given a scenario on which application is used </u>
	- You must be able to say e.g this application will use PCM or PWM or PPM
	- if they use any of those this what the output signal profile will look like 
	- If this application is targeting this type of user this what the PCM, PWM , PPM signal will look like 


4. **Application**
   
   - Be able to tell which modulation technique should be used in what application and justify as to why.
   - Be able to provide the output signal for any given signal in determining an application of the modulation technique.
   - Be able to connect the input and output of the signal.
     
-----
## Identification of the context-specific modulation scheme.

   - In Cases of a BBM signal:
<u> If the user wants his system to have high data rates I want it to achieve data speed of up to 1gig per second what constillation scheme would you recommend </u>

- EXAMPLE: Must be able to tell the user I recommend you yo use 64QAM and why draw the constillation diagram for 64 QAM
- Given the specifications, like data rate requirement, what modulation scheme to use, draw the constellation diagram of that modulation scheme.

## **Role Of Digital Techniques in information representation**
   - Quantisation
     - The process of taking an analog signal(either from a microphone or any sensor), Sample it to get a digital signal, quantise that digital signal and produce different signal presentation of the signal, then map it to diffefrent volatage values those volatge  values those values can now correspond to  binary representation.   
     
## associated value derivation

 - Discuss the importance of Quantisation. How does the degree of quantisation impact the quality produced.
 <u>Explain the concept of quantisation signal to noise ratio</u>
     
- Which is: 
	  $\approx 1.76 + 6.02 \times N$ 
	
	Whereby $N \rightarrow$ number of bits used to quantise the signal as defined here
     - Quantisation resolution = $\left(\frac{V_{max}}{2^n}\right)$
- If we improve quatisation we get sharper pictures   
	- Trasmitting has better quality 
	- Using more quatiing bits means our process becomes computationaly intensive 
 - Quantisation as computationally expensive, but producing higher quality.
	 - When it becomes computationally more intensive we need more rescourcves then we have to go to the cloud
- Encoding is where you  take the quantised signal and map it to binary that is important for data storage, AI training 

- Recognition of Sampling, Compandingin, Quantisation.
     - Companding - A process which ensures that, a signal being transmitted has a limited dynamic range for quantisation.
     - Sampling and Quantisation have been discussed above. Explain encoding while indulging in this.
- Appreciation for the influence of parameters in realizing common applications with varying quality levels.
	- For quatization the key parameter is the number of quantising bits 
	- The parameter it influeces is the number of quantisation resolution, quantisation to noise ratio 
	- We want the resolution to be as low as possible 
	- We want the signal to noise ratio to be as high as possible we do that we need more computational rescources which will be more expensive 

## **Role of Computing technology (Cloud computers and data centers).**

- How to relate bit mapping encoding and quantisation 
- How does the cloud influence those process
   - How does cloud computing enhance the quality of the output and final deliverable in digitization applications.