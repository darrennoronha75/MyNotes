# Strategic Roadmap: Medical Imaging (Theory + Lab Integration)

## PHASE 1: The Signal & The Physics (Foundations)
*Goal: Understand the raw data (Signals) and how physical laws generate it (Forward Model).*
**(Lectures 1, 2, 3, 4 + Lab: "Julia Intro" & "Forward Problem")**

### 1.1: Signal Processing Basics
- [ ] [[Physics Foundations/Signal-to-Noise Ratio]]
- [ ] [[Image Processing/Contrast Definition]]
- [ ] [[Image Processing/Windowing]] (Window Width/Level)
- [ ] [[Reconstruction Theory/Discrete Fourier Transform]] (Complexity & Basis)
- [ ] [[Image Processing/Spatial Resolution]] (Pixel vs True Resolution)
- [ ] **[LAB]** [[Implementation and Lab/Julia Broadcasting]] (Code Structure)
- [ ] **[LAB]** [[Implementation and Lab/Code Profiling]] (Optimization Basics)

### 1.2: Radiography & Attenuation
- [ ] [[Physics Foundations/Lambert-Beer Law]]
- [ ] [[Physics Foundations/Attenuation Coefficient]]
- [ ] [[Hardware and Acquisition/X-ray Source & Detector]]
- [ ] [[Physics Foundations/Projection vs Tomography]] (Loss of depth info)
- [ ] [[Reconstruction Theory/Inverse Problem Definition]] (Introduction to $O=S(I)$)
- [ ] **[LAB]** [[Implementation and Lab/Forward Model Simulation]] (Simulating X-ray physics)
- [ ] **[LAB]** [[Implementation and Lab/Midpoint Rule Integration]] (Numerical integration)

---

## PHASE 2: Analytic Reconstruction (CT)
*Goal: Solve the problem mathematically assuming perfect data (Infinite integrals).*
**(Lecture 5 + Lab: "Part 2 Inverse Problem - CT")**

### 2.1: The Radon Space
- [ ] [[Reconstruction Theory/Radon Transform]]
- [ ] [[Reconstruction Theory/Sinogram]] (The data structure of CT)
- [ ] [[Hardware and Acquisition/CT Gantry Coordinates]]
- [ ] [[Physics Foundations/Tomographic Imaging Equation]]
- [ ] **[LAB]** [[Implementation and Lab/Discretization of Radon]] (Grid mapping)

### 2.2: The Golden Theorem & FBP
- [ ] [[Reconstruction Theory/Fourier Slice Theorem]] (**Crucial Exam Concept**)
- [ ] [[Reconstruction Algorithms/Filtered Back Projection]] (FBP)
- [ ] [[Reconstruction Algorithms/Backprojection Operator]] (The Adjoint)
- [ ] [[Image Processing/Ramp Filter]] (Why we need high-pass filtering)
- [ ] [[Image Processing/Shepp-Logan Filter]] (Noise suppression)
- [ ] **[LAB]** [[Implementation and Lab/Adjoint Operator Implementation]] (Transpose interaction)

---

## PHASE 3: The Inverse Problem (Theory & Stability)
*Goal: Real-world problems. Handling Noise, Ill-posedness, and Stability.*
**(Lecture 6 + Lab: "Part 1 Basics - Inverse Problems")**

### 3.1: Stability Analysis
- [ ] [[Reconstruction Theory/Hadamard Conditions]] (Existence, Uniqueness, Stability)
- [ ] [[Reconstruction Theory/Ill-posedness]]
- [ ] [[Reconstruction Theory/Condition Number]]
- [ ] [[Reconstruction Theory/Singular Value Decomposition]] (SVD Theory)
- [ ] [[Artifacts and Error/Noise Amplification]]

### 3.2: Regularization
- [ ] [[Reconstruction Algorithms/Tikhonov Regularization]] ($L_2$ Penalty)
- [ ] [[Reconstruction Algorithms/Truncated SVD]] (TSVD)
- [ ] [[Artifacts and Error/L-Curve Method]] (Choosing the $\lambda$ parameter)
- [ ] **[LAB]** [[Implementation and Lab/Matrix Sparsity]] (Memory management)

---

## PHASE 4: Iterative Algorithms (Solvers)
*Goal: Solving Ax=b numerically when FBP fails (Sparse data / Complex geometries).*
**(Lecture 7 + CG PDF + Lab: "Part 3 Iterative Methods")**

### 4.1: Algebraic Techniques
- [ ] [[Reconstruction Theory/System Matrix]] (Discretizing the operator)
- [ ] [[Reconstruction Theory/Normal Equation]] ($A^T Ax = A^T b$)
- [ ] [[Reconstruction Algorithms/Algebraic Reconstruction Technique]] (ART)
- [ ] [[Reconstruction Algorithms/Kaczmarz Method]] (Row-action solver)
- [ ] [[Reconstruction Algorithms/Randomized Kaczmarz]] (Speed optimization)

### 4.2: Krylov Subspace Methods
- [ ] [[Reconstruction Theory/Krylov Subspace]]
- [ ] [[Reconstruction Algorithms/Conjugate Gradient Method]] (CG)
- [ ] **[LAB]** [[Implementation and Lab/Iterative Solvers Loop]] (The Code Logic: Forward -> Error -> Back -> Update)

---

## PHASE 5: Magnetic Resonance Imaging (MRI)
*Goal: Fourier encoding. The "System" is a Fourier Transform.*
**(Lecture 9 + Lab: "Part 1 Aliasing" & "Part 2 NFFT")**

### 5.1: MRI Physics
- [ ] [[Physics Foundations/Nuclear Magnetic Resonance]]
- [ ] [[Physics Foundations/Larmor Frequency]]
- [ ] [[Physics Foundations/Bloch Equations]] (Magnetization dynamics)
- [ ] [[Physics Foundations/Longitudinal Relaxation]] ($T_1$)
- [ ] [[Physics Foundations/Transversal Relaxation]] ($T_2$)

### 5.2: k-Space & Acquisition
- [ ] [[Reconstruction Theory/k-space]]
- [ ] [[Hardware and Acquisition/Gradient Coils]] (Spatial Encoding)
- [ ] [[Hardware and Acquisition/Pulse Sequences]]
- [ ] [[Artifacts and Error/Aliasing Artifacts]] (Wrap-around / Nyquist violation)
- [ ] [[Hardware and Acquisition/Radial Trajectory]] (Non-Cartesian sampling)
- [ ] **[LAB]** [[Reconstruction Algorithms/NFFT Algorithm]] (Non-equidistant FFT)
- [ ] **[LAB]** [[Reconstruction Algorithms/Density Compensation]] (Weighting radial data)
- [ ] **[LAB]** [[Artifacts and Error/Undersampling Patterns]] (Cartesian vs Random)

---

## PHASE 6: Magnetic Particle Imaging (MPI)
*Goal: A pure System Matrix approach.*
**(Lecture 8 + Lab: "Matrix Factorization" - connecting SVD to System Matrices)**

- [ ] [[Physics Foundations/Langevin Function]] (Non-linear response)
- [ ] [[Physics Foundations/Superparamagnetism]] (SPIOs)
- [ ] [[Hardware and Acquisition/Field Free Point]] (FFP)
- [ ] [[Physics Foundations/Harmonic Generation]]
- [ ] [[Reconstruction Algorithms/MPI System Matrix Reconstruction]] (Solving $Sc=u$)