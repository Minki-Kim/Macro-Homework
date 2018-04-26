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

