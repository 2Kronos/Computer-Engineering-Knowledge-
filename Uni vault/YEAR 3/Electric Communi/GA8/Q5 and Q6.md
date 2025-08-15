## Question 5
How will the functionality of the designed component i.e., FM Transmitter or FM Receiver be ascertained? Utilizing 
the design and soldered FM Transmitter or FM Receiver, describe the relevant tests (10 marks) and test hardware (10 marks) required in this regard.  (20 marks)
The functionality of the FM Receiver is listed on the product website. It states four overall functionalities. Firstly, Built-in digital automatic gain control (AGC) circuit. Secondly, a Global frequency band of 76 to 108Mhz. Thirdly, simple and easy operation, having five buttons. Each has a function, power, volume up and down, channel auto tune select up and down. Lastly, a channel memory function.
The relevant tests will be conducted to make sure the functionality of these features are in working order. Testing will be limited to only using a digital multimeter, DC power supply and an oscilloscope. However since there is no access to a controlled load tester for the FM receiver the oscilloscope cannot be used either. Taking this into consideration these are the following relevant tests.
Component test (Hardware):


- Testing done before soldering to confirm each individual component is not faulty. 
  - Stops testing interference when connected to other components when soldered.

- `Inductor fault test:`  Use a multimeter set to continuity mode to make sure that current runs through the inductor and beeps when connected to the terminals.


- `Resistor value test:` Use a multimeter set to resistance mode to measure the value of the resistor. Which confirms the component is resisting current as usual.


- `Button push test:`  Use a multimeter set to continuity mode. Make sure that while pushing the button there is a flow of electricity and when not pushing the button the flow stops.


- `Capacitor short test`: The standard multimeter used can’t measure capacitance, however if set to continuity mode it can test if the capacitor is shorted. The capacitor should block dc current and therefore not beep when the terminals are tested.
Feature Functionality tests:
	Power consumption:
	The receiver is rated to use a working voltage of 3V and current of 19mA. This can be tested and confirmed by using a digital
	 multimeter set to voltage mode and probe the input pins. Then for testing the current, using the current mode and connecting the terminal in series with the input pins.


`Frequency range test:`
Due to limited resources (no controlled load) using the local radio stations can be used to test the frequency range. This can be done by using a low frequency like SmileFM(90.4Mhz) and a high frequency station like GoodHopeFM(109.5Mhz I think?). If the radio is able to tune into these stations then it will pass the test even though it is rated to work from 76-108Mhz. Passing this means that the tuning mechanism works.


`Temperature test:` 
	room temperature (since no climate control chamber we cannot test the rated working temperature of -40C to 85C)


`Button functionality tests:`
	Power button: Pass if this turns the circuit on and off.
	Volume controls: Pass if the volume increases and decreases as expected.
	Auto-tuning: Pass if the channel up and down buttons tune to stations and locks into a station for listening. (This is tested in frequency range test as well)
	Channel memory: This receiver should save channel frequency to a memory for fast reconnection. There is no clear way of testing this other than noticing the amount of time it takes to switch between remembered stations. If the switching takes quicker than the first time, it means that the receiver did not need to re-tune but instead used the memory function.
	Overall functionality test: If the receiver is able to pass all these functionalities, outputs a clear sound through the earphone port of the selected radio station then this receiver passes the overall functionality test.


# Question 6 
Present signals and system output from the identified and conducted tests in (5) for either the FM transmitter (7.5 marks) or FM receiver (7.5 marks) 	 (15 marks)
Test outputs:
Inductor Fault test: PASS


Resistor value test: PASS


Button push test: PASS


Capacitor short test: PASS


Power consumption: 2.9V @19mA PASS


Frequency Range Test: Tuned to 90.4Mhz and 104.9Mhz PASS


Buttons:
Power: PASS
Volume controls: PASS
Channel auto-tune: PASS
Channel memory: PASS


Overall functionality: PASS
