<<<<<<< HEAD

![[Pasted image 20241014074238.png]]

![[Pasted image 20241013152956.png]]


![[Pasted image 20240930235508.png]]
--------------------------------------------------------------------------------------
# Voltage divider rule
$X_L =wL$
$X_c = \frac{1}{wc}$
$X_c =2\pi f$
## RC circuit

$$
\begin{align}
V_R =V_{in} \times \frac{R}{\sqrt{R^2+X_L^2}}
\end{align}
$$
$$
\begin{align}
V_C =V_{in} \times \frac{X_c}{\sqrt{R^2+X_C^2}}
\end{align}
$$
# RL Circuit

$$
\begin{align}
V_R =V_{in} \times \frac{R}{\sqrt{R^2+X_L^2}}
\end{align}
$$
$$
\begin{align}
V_L =V_{in} \times \frac{X_L}{\sqrt{R^2+X_L^2}}
\end{align}
$$

# RLC Circuit

$$
Z =\sqrt{R^2+(X_L-x_c)^2}
$$
$$
\begin{align}
V_R =V_{in} \times \frac{R}{Z}
\end{align}
$$
$$
\begin{align}
V_L =V_{in} \times \frac{X_L}{Z}
\end{align}
$$
$$
\begin{align}
V_C =V_{in} \times \frac{X_C}{Z}
\end{align}
$$
---
# Question 1
=======
>>>>>>> bfd6cfd4ac1871bb90df1245e1a5e399fb22b959

# Question 1
$$\begin{align}
|f(jw)|\ =\sqrt{(Re[F(jw)])^2+(Im[F(jw)]^2}\\ \\
f(t) =te^{-at} \leftrightarrow F(jw) =(\frac{1}{a+jw})^2      \\\\
w =2\pi f \\\\
w= 2(\pi)(1.69) =10.6185 \\\\
f(t) = 100te^{-043t}.\\ \\
F(jw)= 100(\frac{1}{0.43+jw})^2\\\\
F(jw)= 100(\frac{1}{0.43+10.6185j})^2\\\\
let\ z = 0.43 +10.6185j \\\\\
|z| = \sqrt{(0.43)^2+(10.6185)^2}\\\\
|z| = 10.6272\\\\
|F(jw)|= 100(\frac{1}{10.6272})^2\\\\
|F(jw)|=0.885 \\\\
\end{align}$$
---
# Question 2 

![[Pasted image 20241012121147.png]]

$$
\begin{align}
B_{wf} = \frac{1}{T}= \frac{1}{16.3us}=61.3KHZ
\end{align}
$$
---
# Question 3
![[Pasted image 20241013155407.png]]

![[Pasted image 20241013155603.png]]
![[Calcu 2 1.jpg]]
![[cal 3.jpg]]
---
# Question 5
![image](https://github.com/user-attachments/assets/d3306052-1ae8-4e24-b67f-e740b4d6fe45)


$a = 0.75$

$na^n = \frac{az}{(z - a)^2}$

$y[n] = x[n] + ay[n-1]$

$Y(z) = \frac{0.8z}{(z - 0.8)^2} + 0.75 \frac{Y(z)}{z}$

$Y(z) - 0.75 \frac{Y(z)}{z} = \frac{0.8z}{(z - 0.8)^2}$

$Y(z)(1 - \frac{0.75}{z}) = \frac{0.8z}{(z - 0.8)^2}$

$\frac{1}{z}Y(z)(1 - \frac{0.75}{z}) = \frac{0.8z}{(z - 0.8)^2} \times \frac{1}{z}$

$\frac{1}{z}Y(z)(\frac{z - 0.75}{z}) = \frac{0.8}{(z - 0.8)^2}$

$\frac{1}{z}Y(z) = \frac{0.8}{(z - 0.8)^2} \times \frac{z}{z - 0.75}$

$\frac{1}{z}Y(z) = \frac{0.8z}{(z - 0.8)^2(z - 0.75)}$

$\frac{0.8z}{(z - 0.8)^2(z - 0.75)} = \frac{A}{z - 0.8} + \frac{B}{(z - 0.8)^2} + \frac{C}{z - 0.75}$

$0.8z = A(z - 0.8)(z - 0.75) + B(z - 0.75) + C(z - 0.8)^2$

Let $z = 0.8$

$0.8(0.8) = B(0.8 - 0.75)$

$\frac{0.64}{0.05} = B$

$12.8 = B$

Let $z = 0.75$

$0.8(0.75) = C(0.75 - 0.8)^2$

$0.6 = C(\frac{1}{400})$

$0.6 \times \frac{400}{1} = C$

$240 = C$

Solve for $A$ let $z = 1$

$0.8z = A(z - 0.8)(z - 0.75) + B(z - 0.75) + C(z - 0.8)^2$

$0.8 = A(0.2)(0.25) + B(0.25) + C(0.2)^2$

$0.8 = A(0.05) + 12.8(0.25) + 240(0.2)^2$

$0.8 = A(0.05) + 12.8$

$0.8 - 12.8 = A(0.05)$

$-\frac{12}{0.05} = A$

$-240 = A$

$\frac{1}{z}Y(z) = \frac{A}{z - 0.8} + \frac{B}{(z - 0.8)^2} + \frac{C}{z - 0.75}$

$\frac{1}{z}Y(z) = -\frac{240}{z - 0.8} + \frac{12.8}{(z - 0.8)^2} + \frac{240}{z - 0.75}$

$Y(z) = -\frac{240z}{z - 0.8} + \frac{12.8z}{(z - 0.8)^2} + \frac{240z}{z - 0.75}$

$Y(z) = -\frac{240z}{z - 0.8} + 16 \frac{0.8z}{(z - 0.8)^2} + \frac{240z}{z - 0.75}$

$y(n) = - (240)(0.8)^n + 16 n(0.8)^n + (240)(0.75)^n$

$y(n) = - (240)(0.8)^{11} + 16 (11)(0.8)^{11} + (240)(0.75)^{11}$

$y(n) = 4.6388$



---
# Question 6
![[Pasted image 20241013140521.png]]

$w = 2\pi f$

$w = 2\pi (6.7k)$

$w = 13400\pi$

$X_C = \frac{1}{wC}$

$X_C = \frac{1}{13400\pi (7\mu F)}$

$X_C = 3.3934$

$V_C = V_{in} \times \frac{X_C}{\sqrt{R^2 + X_C^2}}$

$V_C = 37 \times \frac{3.3934}{\sqrt{3^2 + (3.3934)^2}}$

$V_C = 27.720$
---
# Question 7
![[Pasted image 20241013140621.png]]
$$\begin{align}
V_{in} = tu(t) \\ \\
V_R = IR \\\\
V_C = \frac{1}{C} \int^{t}_{0} i(t) \\\\
V_{in} = IR + \frac{1}{C} \int^{t}_{0} i(t) \\\\
L(tu(t)) = L(i(t)) + L\left(\frac{1}{C} \int^{t}_{0} i(t)\right) \\\\
\frac{1}{s^2} = I(s)R + \frac{1}{C} \times \frac{I(s)}{s} \\\\
\text{Pull out } I(s) \\\\
\frac{1}{s^2} = I(s)(R + \frac{1}{Cs}) \\\\
I(s) = \frac{1}{s^2} \times \frac{Cs}{CsR + 1} \\\\
I(s) = \frac{C}{s(CsR + 1)} \\\\
V_{out} = \frac{1}{Cs}I(s) \\\\
V_{out} = \frac{1}{sC} \times \frac{C}{s(CsR + 1)} \\\\
V_{out} = \frac{1}{s^2(CsR + 1)}\\\\
R=1\\\\
C=5\\\\
V_{out} = \frac{1}{s^2(s5 + 1)}\\\\
\text{pull out 5}\\\\
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
