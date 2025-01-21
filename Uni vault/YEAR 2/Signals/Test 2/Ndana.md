$$\begin{align}
V_{in} = tu(t) \\ \\
V_R = IR \\\\
V_C = \frac{1}{C} \int^{t}_{0} i(t) \\\\
L(V_L) =LsI(s)\\\\
Vin =V_R+V_L+V_C    \\\\
L(Vin) =L(V_R+V_L+V_C)    \\\\

\frac{1}{s} = I(s)R + LsI(s)+\frac{1}{C} \times \frac{I(s)}{s} \\\\

\text{Pull out } I(s) \\\\

\frac{1}{s} = I(s)(R +Ls+ \frac{1}{Cs}) \\\\


\frac{1}{s} = I(s)((R +Ls)+ \frac{1}{Cs}) \\\\

\frac{1}{s} = I(s)(\frac{(Cs(R +Ls)+1)}{Cs}) \\\\

I(s) = \frac{1}{s} \times (\frac{Cs}{(Cs(R +Ls)+1)}) \\\\

I(s) =  (\frac{C}{(Cs(R +Ls)+1}) \\\\

V_{out} = \frac{1}{Cs}I(s) \\\\

V_{out} = \frac{1}{sC} \times (\frac{C}{(Cs(R +Ls)+1)}) \\\\

V_{out} = \frac{1}{s^2C(R +Ls)+1)}\\\\
R=0.3\\\\
C=1\\\\
L=1\\\\
V_{out} = \frac{1}{s^2(0.3 +s)+1)}\\\\

V_{out} = \frac{1}{s^20.3 +s^3+1)}\\\\
V_{out} = \frac{1}{s^3+s^20.3 +1)}\\\\

V_{out} = \frac{1}{s^25(s + \frac{1}{5})}\\\\
V_{out} = \frac{\frac{1}{5}}{s^2(s + \frac{1}{5})}\\\\
V_{out} = \frac{\frac{1}{5}}{s^2(s + \frac{1}{5})} = \frac{A}{s}+\frac{B}{s^2}+\frac{C}{s+\frac{1}{5}}\\\\

s^2(s + \frac{1}{5})\times \frac{\frac{1}{5}}{s^2(s + \frac{1}{5})} = (\frac{A}{s}+\frac{B}{s^2}+\frac{C}{s+\frac{1}{5}}) \times^2 (s + \frac{1}{5})\\\\

\frac{1}{5}=A[s(s+\frac{1}{5})] +B[s+\frac{1}{5}] +C[s^2]\\\\

\text{let s = 0}\\\\
\frac{1}{5}=B[\frac{1}{5}]\\\\
1=B\\\\
\text{let s} =-\frac{1}{5}\\\\
\frac{1}{5} =C[(\frac{1}{25}]\\\\
\text{5 =C}\\\\

\text{let s = 1}\\\\
\frac{1}{5}= 1.2A+1.2 +5\\\\
\frac{1}{5}-1.2-5=1.2A\\\\
\frac{-6}{1.2}=\frac{1.2A}{1.2}\\\\
-5=A\\\\
\frac{A}{s}+\frac{B}{s^2}+\frac{C}{s+\frac{1}{5}}\\\\
-\frac{5}{s}+\frac{1}{s^2}+\frac{5}{s+\frac{1}{5}}\\\\
-5\frac{1}{s}+\frac{1}{s^2}+5\frac{1}{s+\frac{1}{5}}\\\\

-5u(t)+t+5e^{-\frac{1}{5}t}\\\\

u(t)\\\\
u(4)=1\\\\
u(t)=1\\\\
-5u(2.8)+2.8+5e^{-\frac{1}{5}(2.8)}=0.656\\\\
	
\end{align}$$