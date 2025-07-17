
#### Section A: Understanding of Sources

<u>Summarize the key contributions of any two research articles from your literature review. What specific problem(s) did each study address and what were the main findings?</u>

Micromachines address the issue of the declining farm workers in the farming sector. Other farm products can be taken care of using automation but fruits need actual human intervention. The Robotic arm constructed here is suppose to work in the agricultural context. The main finding of this report was that the Arm  Robotic arm achieves **accuracy** in replicating hand trajectories.  (~0.325 s latency).  This was due to their hybrid approach of using 10 flex sensor, 3 optitrack marker and 6 optitrack cameras.

Sethukarasi et al., 2022 IJCAT addresses the need for a multipurpose robotic arm for various purposes. The main finding is that the Gesture controlled robotic arm mainly work by knowing the predefined gestures before hand it achieved successful hand gesture recognition and corresponding mechanical movement of the arm based on that gesture.  It was also cheaper than the Micromachine arm


<u>Identify one methodology or technology used in your reviewed literature. Explain how it works and why it was relevant to the research it was applied in.</u>

Sethukarasi et al., 2022 IJCAT version has the closest version of the arm I amtrying to build as they are use flex sensors and Servor motors, arduino and wireless control. It worked as shown below.

 Transmitter: Flex sensors detect finger movements → Arduino Nano processes data → NRF24L01 transceiver transmits  
   - Receiver: Arduino UNO receives signals → MG995 servo motors (10-15kg/cm torque) actuate 3D-printed robotic hand  
   - Achieves **100% gesture recognition accuracy** with **5s response delay** (Table 1)  

It also shows me I can Combine flex sensors (for finger movements) and the MPU6050 (for wrist orientation) to replicate the hybrid approach in Micromachines, but at a lower cost
 
----
#### Section B: Critical Analysis

<u>Choose one solution or approach discussed in your literature review. Critically evaluate its strengths and limitations, particularly in the context of your own research problem.</u>

Propulsion Tech Jornal 2023

The strenghts are 
- Demonstrated real-time responsiveness and adaptability to diverse gestures.
- Highlighted precision in tasks like pick-and-place and assembly.

The limitations are

Latency and calibration for different hand sizes. 
Safety protocols to prevent unintended movements

<u>Were there any contradictions or disagreements among the sources in your literature review? If so, describe them and explain how you addressed or interpreted them.</u>

Yes Micromachines concluded that the hybrid approach was better but 2023) – UCAT achieved a higher accuracy I addressed by concluding that I will take the UCAT version because it has a higher accuracy and at a lower cost

<u>Based on the literature you reviewed, what gap(s) in the existing research did you identify? How does your project aim to address these gaps? </u>

----

#### Section C: Application to Your Research

<u>How has the literature you reviewed influenced your research design or approach? Provide specific examples from your sources.</u>

<u>Which model, framework, or concept from the literature did you find most relevant to your study, and how are you applying it?</u>

<u>If you were to exclude one of your reviewed sources, which one would it be and why? Consider relevance, credibility, or duplication of information.</u>

#### Section D: Research Process Insight

<u>Describe the process you used to search for and select literature for your review. What criteria did you use to determine what was “relevant”?</u>

<u>Reflecting on your literature review, what challenges did you face during the process of synthesizing different sources, and how did you overcome them? </u>                                                                         

<u>Optional Bonus Questions (for deeper evaluation)
Imagine you had to update your literature review today. What new technologies, recent studies, or changes in the field would you include?</u>

<u>How do the reviewed studies justify the need for your project or demonstrate that your research question is worth exploring?</u>
