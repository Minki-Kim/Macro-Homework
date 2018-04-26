# ECON 210C HW3 Q5 - Churn Ken Lee

# Load required packages
using NLsolve
using Plots; gr()

# Change working directory
cd("C:/Users/churn/Documents/UCSD/Spring_2018/ECON_210C/Macro-Homework/Wieland_HW3/Ken")

# Define a function that computes the residuals of the 4 equations.
function Residuals(guess)
    α = 0.33
    β = 0.99
    δ = 0.02
    ρ = 0.9
    η = 0.5
    GYss = 0.2
    YKss = (1/β - 1 + δ)/α
    KYss = 1/YKss
    IYss = δ*KYss
    CYss = 1 - IYss - GYss
    vck = guess[1]
    vcg = guess[2]
    vkk = guess[3]
    vkg = guess[4]

    eulerLHSK = vck*vkk - vck
    eulerLHSG = vck*vkg + vcg*ρ - vcg
    eulerRHSconstant = α*YKss/(α*YKss + 1 - δ)
    eulerRHSK = CYss*vck*vkk + IYss*(vkk-1+δ)*vkk/δ - vkk
    eulerRHSG = CYss*vck*vkg + CYss*vcg*ρ + IYss*(vkk-1+δ)*vkg/δ + IYss*vkg*ρ/δ + GYss*ρ - vkg

    llLHSK = vck - (1/η + 1)*α/(1-α)
    llLHSG = vcg
    llRHSconstant = (-α-1/η)/(1-α)
    llRHSK = CYss*vck + IYss*(vkk-1+δ)/δ
    llRHSG = CYss*vcg + IYss*vkg/δ + GYss

    diff = Array{Float64}(4)
    diff[1] = eulerLHSK - eulerRHSconstant*eulerRHSK
    diff[2] = eulerLHSG - eulerRHSconstant*eulerRHSG
    diff[3] = llLHSK - llRHSconstant*llRHSK
    diff[4] = llLHSG - llRHSconstant*llRHSG

    return diff
end

# Solve system using NLsolve
results = nlsolve(Residuals, [1.1; 1.1; 1.1; 1.1]; inplace = false)

# Obtain solution from results
vck = results.zero[1]
vcg = results.zero[2]
vkk = results.zero[3]
vkg = results.zero[4]

# Simulate paths of variables in response to shocks
α = 0.33
β = 0.99
δ = 0.02
ρ = 0.9
η = 0.5
GYss = 0.2
YKss = (1/β - 1 + δ)/α
KYss = 1/YKss
IYss = δ*KYss
CYss = 1 - IYss - GYss
T = 50

C = zeros(T)
Y = zeros(T)
I = zeros(T)
w = zeros(T)
r = zeros(T)
K = zeros(T+1)
L = zeros(T)
G = zeros(T+1)
G[1] = 1

for t = 1:T
    C[t] = vck*K[t] + vcg*G[t]
    K[t+1] = vkk*K[t] + vkg*G[t]
    G[t+1] = ρ*G[t]
    I[t] = (K[t+1] - (1-δ)*K[t])/δ
    Y[t] = CYss*C[t] + IYss*I[t] + GYss*G[t]
    L[t] = (Y[t] - C[t])/(1/η+1)
    r[t] = Y[t] - K[t]
    w[t] = Y[t] - L[t]
end
T_vect = linspace(1,T,T)

IRF_b_plot = plot(T_vect, [C, K[2:end], G[1:end-1], I, Y, L, r, w], legend = false, xlabel = "t", ylabel = "", title = ["C" "K" "G" "I" "Y" "L" "r" "w"], size=(1600,1000), layout = 8)
display(IRF_b_plot)
savefig("output/IRF_b_plot.pdf")

# Convert IRF for Y into dollars
Y_level = Y/GYss
IRF_c_plot = plot(T_vect, Y_level, legend = false, xlabel = "t", ylabel = "", title = "IRF for Y in levels", size=(1600,1000))
display(IRF_c_plot)
savefig("output/IRF_c_plot.pdf")


# Rerun all of the above with ρ = 1
function Residuals_rho(guess)
    α = 0.33
    β = 0.99
    δ = 0.02
    ρ = 1
    η = 0.5
    GYss = 0.2
    YKss = (1/β - 1 + δ)/α
    KYss = 1/YKss
    IYss = δ*KYss
    CYss = 1 - IYss - GYss
    vck = guess[1]
    vcg = guess[2]
    vkk = guess[3]
    vkg = guess[4]

    eulerLHSK = vck*vkk - vck
    eulerLHSG = vck*vkg + vcg*ρ - vcg
    eulerRHSconstant = α*YKss/(α*YKss + 1 - δ)
    eulerRHSK = CYss*vck*vkk + IYss*(vkk-1+δ)*vkk/δ - vkk
    eulerRHSG = CYss*vck*vkg + CYss*vcg*ρ + IYss*(vkk-1+δ)*vkg/δ + IYss*vkg*ρ/δ + GYss*ρ - vkg

    llLHSK = vck - (1/η + 1)*α/(1-α)
    llLHSG = vcg
    llRHSconstant = (-α-1/η)/(1-α)
    llRHSK = CYss*vck + IYss*(vkk-1+δ)/δ
    llRHSG = CYss*vcg + IYss*vkg/δ + GYss

    diff = Array{Float64}(4)
    diff[1] = eulerLHSK - eulerRHSconstant*eulerRHSK
    diff[2] = eulerLHSG - eulerRHSconstant*eulerRHSG
    diff[3] = llLHSK - llRHSconstant*llRHSK
    diff[4] = llLHSG - llRHSconstant*llRHSG

    return diff
end

# Solve system using NLsolve
results = nlsolve(Residuals_rho, [1.1; 1.1; 1.1; 1.1]; inplace = false)

# Obtain solution from results
vck = results.zero[1]
vcg = results.zero[2]
vkk = results.zero[3]
vkg = results.zero[4]

# Simulate paths of variables in response to shocks
α = 0.33
β = 0.99
δ = 0.02
ρ = 1.0
η = 0.5
GYss = 0.2
YKss = (1/β - 1 + δ)/α
KYss = 1/YKss
IYss = δ*KYss
CYss = 1 - IYss - GYss
T = 50

C = zeros(T)
Y = zeros(T)
I = zeros(T)
w = zeros(T)
r = zeros(T)
K = zeros(T+1)
L = zeros(T)
G = zeros(T+1)
G[1] = 1

for t = 1:T
    C[t] = vck*K[t] + vcg*G[t]
    K[t+1] = vkk*K[t] + vkg*G[t]
    G[t+1] = ρ*G[t]
    I[t] = (K[t+1] - (1-δ)*K[t])/δ
    Y[t] = CYss*C[t] + IYss*I[t] + GYss*G[t]
    L[t] = (Y[t] - C[t])/(1/η+1)
    r[t] = Y[t] - K[t]
    w[t] = Y[t] - L[t]
end

IRF_d_plot = plot(T_vect, [C, K[2:end], G[1:end-1], I, Y, L, r, w], legend = false, xlabel = "t", ylabel = "", title = ["C" "K" "G" "I" "Y" "L" "r" "w"], size=(1600,1000), layout = 8)
display(IRF_d_plot)
savefig("output/IRF_d_plot.pdf")

# Convert IRF for Y into dollars
Y_level = Y/GYss
IRF_d_Y_plot = plot(T_vect, Y_level, legend = false, xlabel = "t", ylabel = "", title = "IRF for Y in levels", size=(1600,1000))
display(IRF_d_Y_plot)
savefig("output/IRF_d_Y_plot.pdf")