# Question 1
![image](https://github.com/user-attachments/assets/f7438664-e168-43d9-bebe-cb9106af5342)

**Answer = 20.589 $\pm$ 0.002** 
**Marks: 14**

Transfer function 

$$H(s)=\frac{Y(s)}{X(s)}$$

$$H(s)=\frac{V_{out}(s)}{V_{in}(s)}$$
$$H(S)= \frac{4}{s+0.25}$$
$$V_{in}(t) = te^{-0.2t}$$
$$L(V_{in}) = L(te^{-0.2t})$$
$$V_{in}(s)= \frac{1}{(s+0.2)^2}$$
$$V_{out}(s) = V_{in}(s) \times H(s)$$$$V_{out}(s)= \frac{1}{(s+0.2)^{2}} \times \frac{4}{(s+0.25)}  $$ $$V_{out}(s)= \frac{4}{(s+0.2)^{2}(s+0.25)}$$
$$V_{out}(s) =\frac{A}{(s+0.2)} + \frac{B}{(s+0.2)^{2}} + \frac{C}{(s+0.25)}+ \frac{1}{2}$$
$$4 = A(s+0.2)(s+0.25)+B(s+0.25) +C(s+0.2)^{2}$$
Let s = -0.2

$$4= B(-0.2+0.25)$$
$$80=B$$
**Let s=-0.25**
$$4= C(-0.25+0.2)^{2}$$
$$\frac{4}{(\frac{1}{400})} = C$$
$$1600 =C$$
**Let s =0**
$$4=A(0+0.2)(0+0.25)+B(0+0.25)+C(0+0.2)^{2}$$
$$4= A(0.05)+B(0.25)+C(0.2)^{2}$$
$$4= A(0.05)+80(0.25)+1600(0.2)^{2}$$
$$4 = A(0.05)+84$$
$$4-84=A(0.05)$$
$$\frac{-80}{0.05}=A$$
$$-1600=A$$
$$V_{out}(s) =-\frac{1600}{(s+0.2)} + \frac{80}{(s+0.2)^{2}} + \frac{1600}{(s+0.25)}$$
$$V_{out}(s) =-1600\frac{1}{(s+0.2)} + 80\frac{1}{(s+0.2)^{2}} + 1600\frac{1}{(s+0.25)}$$
$$V_{out}(s) =-1600e^{-0.2t} + 80te^{-0.2t} + 1600e^{-0.25t}$$
$$V_{out}(s) =-1600e^{-0.2(6.43)} + 80(6.43)e^{-0.2(6.43)} + 1600e^{-0.25(6.43)}$$
$$V_{out}=20.589$$
# Question 2

![image](https://github.com/user-attachments/assets/b8cd2426-f3ba-474d-9df5-92d49ab73f7a)
**Marks:10**
**Answer:-0.784 $\pm$ 0.002**
		$$T_0\ is\ period\ of\ cosine\ wave\ = T_0 = A-(-\frac{A}{3})= \frac{4A}{3}= \frac{4\times0.4}{3} =\frac{8}{15}$$
$$T\ period\ of\ sample\ = A-(-A) = 0.4-(-0.4)=0.8$$

$$w_0=\frac{2\pi }{T_0}=\frac{2\pi}{0.9}=6.98131$$
$$w=2\pi (4.4)=27.6460$$
$$T_0=\frac{3A}{2}=\frac{3(0.6)}{2}=0.9$$
$$(w-w_o) \frac{T}{2}=(27.6460-6.98131) \frac{1.2}{2}$$



# Question 3

![image](https://github.com/user-attachments/assets/734b3347-7a3b-4e73-b8ce-120cdbc4371b)



**Marks:14**
**Answer:14.798 $\pm$ 0.002**

$$a = 0.1$$
$$n = \frac{z}{(z - 1)^2}$$

$$y[n] = ax[n] + (1-a)y[n-1]$$

$$Y(z) = 0.1\frac{z}{(z - 1)^2} + (1-0.1) \frac{Y(z)}{z}$$

$$Y(z) - 0.9 \frac{Y(z)}{z} =0.1 \frac{z}{(z - 1)^2}$$

$$Y(z)(1 - \frac{0.9}{z}) = \frac{0.1z}{(z - 1)^2}$$

$$\frac{1}{z}Y(z)(1 - \frac{0.9}{z}) = \frac{0.1z}{(z - 1)^2} \times \frac{1}{z}$$

$$\frac{1}{z}Y(z)(\frac{z - 0.9}{z}) = \frac{0.1}{(z - 1)^2}$$

$$\frac{1}{z}Y(z) = \frac{0.1}{(z - 1)^2} \times \frac{z}{z - 0.9}$$

$$\frac{1}{z}Y(z) = \frac{0.1z}{(z - 1)^2(z - 0.9)}$$

$$\frac{0.1z}{(z - 1)^2(z - 0.9)} = \frac{A}{z - 1} + \frac{B}{(z - 1)^2} + \frac{C}{z - 0.9}$$

$$0.1z = A(z - 1)(z - 0.9) + B(z - 0.9) + C(z - 1)^2$$

Let $z = 0.9$

$$0.1(0.9) =C(0.9- 1)^2$$

$$\frac{0.09}{0.01} = C$$

$$9 = C$$

Let $z = 1$

$$0.1(1) = B(1 - 0.9)$$
$$0.1 = B(0.1)$$
$$\frac{0.1}{0.1} = B$$
$$1 = B$$

Solve for $A$ let $z = 0$

$$0.1z = A(z - 1)(z - 0.9) + B(z - 0.9) + C(z - 1)^2$$

$$0 = A(-1)(-0.9) + B(-0.9) + C(-1)^2$$

$$0 = A(0.9) + 1(-0.9) + 9(-1)^2$$

$$0 = A(0.9) +8.1$$

$$-8.1 = A(0.9)$$

$$-\frac{8.1}{0.9} = A$$

$$-9= A$$

$$\frac{1}{z}Y(z) = \frac{A}{z - 1} + \frac{B}{(z - 1)^2} + \frac{C}{z - 0.9}$$

$$\frac{1}{z}Y(z) = -\frac{9}{z - 1} + \frac{1}{(z - 1)^2} + \frac{9}{z - 0.9}$$
$$Y(z) = -\frac{9z}{z - 1} + \frac{1z}{(z - 1)^2} + \frac{9z}{z - 0.9}$$

$$Y(z) = -9\frac{z}{z - 1} + \frac{z}{(z - 1)^2} + 9\frac{z}{z - 0.9}$$

$$y(n) =  -(9) + n + (9)(0.9)^n$$

$$y(n) =  -(9) + 23 + (9)(0.9)^{23}$$

$y(n) = 14.798$


# Question 4

![image](https://github.com/user-attachments/assets/4c6d2f89-d72c-44f3-be1c-37dca55bc1fe)

**Marks:10**
**Answer:42.693 $\pm$ 0.002**

$$w = 2\pi f$$

$$w = 2\pi (0.6k)$$

$$w =1200\pi $$

$$X_C = \frac{1}{wC}$$

$$X_C = \frac{1}{1200\pi (14.7\mu F)}$$

$$X_C = 18.044$$

$$V_C = V_{in} \times \frac{X_C}{\sqrt{R^2 + X_C^2}}$$

$$V_C = 50 \times \frac{18.044}{\sqrt{11^2 + (18.044)^2}}$$

$$V_C =42.692 $$

# Question 5
![image](https://github.com/user-attachments/assets/032cfa07-f5cf-4fb2-b5b1-7ba5138fe268)

**Marks:12**
**Answer:1.321 $\pm$ 0.002**

$$V_{in} = 8e^{-0.5t}$$

$$V_R = IR$$

$$V_C = \frac{1}{C} \int^{t}_{0} i(t)$$

$$V_{in} = IR + \frac{1}{C} \int^{t}_{0} i(t)$$

$$L(tu(t)) = L(i(t)) + L\left(\frac{1}{C} \int^{t}_{0} i(t)\right)$$

$$\frac{8}{s+0.5} = I(s)R + \frac{1}{C} \times \frac{I(s)}{s}$$

$$\text{Pull out } I(s)$$

$$\frac{8}{s+0.5} = I(s)(R + \frac{1}{Cs})$$

$$I(s) = \frac{8}{s+0.5} \times \frac{Cs}{CsR + 1}$$

$$I(s) = \frac{8Cs}{(s+0.5)(CsR + 1)}$$

$$V_{out} = \frac{1}{Cs}I(s)$$

$$V_{out} = \frac{1}{sC} \times \frac{8Cs}{(s+0.5)(CsR + 1)}$$

$$V_{out} = \frac{8}{(s+0.5)(CsR + 1)}$$

$$R=5$$

$$C=0.5$$

$$V_{out} = \frac{8}{(s+0.5)(s2.5 + 1)}$$

$$\text{pull out 2.5 we prefer s to have no coefficients }$$

$$V_{out} = \frac{8}{(s+0.5)\frac{5}{2}(s + \frac{2}{5})}$$
$$V_{out} = \frac{8\times \frac{2}{5}}{(s+0.5)(s + \frac{2}{5})}$$
$$V_{out} = \frac{3.2}{(s+0.5)(s + \frac{2}{5})}$$
$$V_{out}  = \frac{A}{s+0.5}+\frac{B}{s+0.4}$$

$$V_{out}=A[s+0.4] +B[s+0.5]$$

$$\text{let s = -0.5}$$

$$3.2=A[-0.1]$$

$$\frac{3.2}{-0.1}=A$$

$$-32=A$$

$$\text{let s} =-0.4$$

$$3.2 =B[0.1]$$
$$\frac{3.2}{0.1} =B$$

$$32=B$$

$$V_{out}  = -\frac{32}{s+0.5}+\frac{32}{s+0.4}$$
$$V_{out}  = -32\frac{1}{s+0.5}+32\frac{1}{s+0.4}$$

$$V_{out}=-32e^{-0.5t}+32e^{-0.4t}$$
$$V_{out}=-32e^{-0.5(5.97)}+32e^{-0.4(5.97)}$$
$$V_{out}=1.321$$
