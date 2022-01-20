---
title: Signal and System fiche
author: Pierre Colson
linkcolor: blue
---

---

**Markdown** version on
[*github*](https://raw.githubusercontent.com/caillouc/Fiche_EPFL/main/Signals_and_Systems/Signals_and_Systems.md)  
Compiled using [*pandoc*](https://pandoc.org/) and [*`gpdf` script*](https://github.com/caillouc/dotfile/blob/linux/gpdf.sh)  
More fiches [*here*](https://github.com/caillouc/Fiche_EPFL)  

# General Stuff

* **Euler formula**

  $$ \cos(x) = \text{Re}(e^{ix}) = \frac{e^{ix} + e^{-ix}}{2} $$

  $$ \sin(x) = \text{Im}(e^{ix}) = \frac{e^{ix} - e^{-ix}}{2i} $$

  $$ e^{ix} = \cos(x) +i\sin(x) $$

  $$ e^{-ix} = \cos(-x) + i \sin(-x) = \cos(x) - i \sin(x) $$

  * Impulse response $= h(t)$
  * Transfer function $= H(s)$
  * Frequency response $= H(j\omega)$

# Signals and Systems

## Signals

* A continuous-time signal $x(t)$ is called **periodic** with priod $T$ if for all times $t$ we have : $x(t) = x(t+T)$ (idem for discrete time)

* The **Energy** of a signal:
  * Continuous signal: $\mathcal{E} = \int_{-\infty}^{\infty} |x(t)|^2dt$
  * Discrete signal: $\mathcal{E} = \sum_{n=-\infty}^{\infty} |x[n]|^2$

* The **Power** of a signal:
  * Continuous time: $\mathcal{P} = \lim_{T \to \infty}\frac{1}{2T}\int_{-T}^T |x(t)|^2dt$
  * Discrete time: $\mathcal{P} = \lim_{N \to \infty}\frac{1}{2N+1}\sum_{n=-N}^N |x[n]|^2$

## Systems

* A **System** takes a signal as input and outputs a new signal. It is express as : $y(t) = \mathcal{H}\{x(t)\}$ or $y[n] = \mathcal{H}\{x[n]\}$

* Properties:
  * **Linearity**: $\mathcal{H}\{a_1x_1(t)+a_2x_2(t)\} = a_1\mathcal{H}\{x_1(t)\}+a_2\mathcal{H}\{x_2(t)\}$ (idem for discrete time)
  * **Time Invariance**:  *if* system input $x(t)$ procuces system output $y(t)$ *then* system input $x(t-\tau)$ produces system output $y(t-\tau)$ (idem for discrete time)
  * **Memory**: The system output only depends on the current system input (idem for discrete time)
  * **Invertibility**: A system is called invertible if distinct inputs lead to distinct outputs (idem for discrete time)
  * **Causality**: A System is causal if its output signal only depends on present and past inputs, but not on future inputs (idem for discrete time)
  * **Stability**: A system $\mathcal{H}$ is *stable* if for all *bounded* input signals $x(t)$, the corresponding output signal $y(t) = \mathcal{H}\{x(t)\}$ is also bounded. (idem for discrete time)

# Linear Time Invariant Systems (LTI)

* *Kronecker-delta fucntion*:

  $$
  \delta[n] =
  \left\{
    \begin{array}{ll}
      1, \quad \text{for } n=0,  \\
      0, \quad \text{otherwise}
    \end{array}
  \right.
  $$

* **Impulse Response**: The fundamental upshot is that any LTI system os uniquely characterized by its impulse response.

  * Discrete time: $h(n) = \mathcal{H}\{\delta[n]\}$ is simply the system repsonse when the input is Kronecker-delta fucntion $\delta[n]$. The signal $h[n]$ is called the *inpulse response* of the system $\mathcal{H}\{\cdot\}$. We can characterize the system output signal as:

    $$ y[n] = \sum_{k=-\infty}^{\infty} x[k]h[n-k] $$

  * Continuous time: $h(t) = \mathcal{H}\{\delta(t)\}$ is simply the system repsonse when the input is Dirac delta fucntion $\delta(t)$. The signal $h(t)$ is called the *inpulse response* of the system $\mathcal{H}\{\cdot\}$. We can characterize the system output signal as:

    $$ y(t) = \int_{-\infty}^{\infty} x(\tau)h(t-\tau)d\tau $$

* **Convolution operation**: The output signal is simply ginven by the convolution of the input signal with the impulse response.
  * Discrete time: $[x*h](n) = \sum_{k=-\infty}^{\infty} x[k]h[n-k]$
  * Continuous time: $(x*h)(t) = \int_{-\infty}^{\infty} x(\tau)h(t-\tau)d\tau$
  * Properties:
    * *Commutative*: $(x*h)(t) = (h*x)(t)$ (idem for discrete time)
    * *Distributive*: $(x*(h_1+h_2))(t) = (x*h_1)(t) + (x*h_2)(t)$ (idem for dicrete time)
    * *Associative*: $((x*h_1)*h_2) = (x*(h_1*h_2))$ (idem for discrete time)

* **Composition** of LTI systems
  * Parallel: $y(t) = \mathcal{G}\{x(t)\} = \mathcal{H}_1\{x(t)\} + \mathcal{H}_2\{x(t)\}$. If both $\mathcal{H}_1$ and $\mathcal{H}_2$ are LTI system $\mathcal{G}$ is also an LTI system and its impulse response $g(t)$ is given by: $g(t) = h_1(t) + h_2(t)$ (idem for discrete time)
  * Serie: $y(t) = \mathcal{G} = \mathcal{H}_2\{\mathcal{H}_1\{x(t)\}\}$. If both $\mathcal{H}_1$ and $\mathcal{H}_2$ are LTI system $\mathcal{G}$ is also an LTI system and its impulse response $g(t)$ is given by: $g(t) = \int_{-\infty}^{\infty} h_1(\tau)h_2(t-\tau)d\tau$ or $g[n]= \sum_{k=-\infty}^{\infty} h_1[k]h_2[n-k]$

* **Properties**:
  * **Memory**: An LTI system is *memoryless* if and only if, for some constant $a$ we have: $y(t) = ax(t)$ (idem for discrete time) (idem for discrete time)
  * **Invertibility** An LTI system with impulse response $h(t)$ si *invertible* if and only if there exists a function $g(t)$ such that $(g*h)(t) = \delta(t)$. (idem for discrete time)
  * **Causality**: An LTI system is *causal* if and only if the impulse response function is indetically zero for negative lags: $h(t) = 0$ for $t < 0$ (idem for discrete time)
  * **Stability**: An LTI system is *stable* if and only if the impulse response function absolutely integrable (or summable), i.e., if and only if: $\int_{-\infty}^{\infty} |h(t)|dt < \infty$ or $\sum_{k=-\infty}^{\infty}|h[k]| < \infty$

# Fourier Methods for Stable LTI Systems

@import "Fourier_Appendix.pdf"

# Frequency Response of Stable LTI Systems

* **Frequency response** Let us suppose that the input to our stable LTI system is given by $x(t) = e^{jw_0t} \text{ or } x[n] = e^{jw_0t}$. Then the output is given by :
  
  * Continuous:

    $$ y(t) = \int_{-\infty}^{\infty} e^{jw_0(t- \tau)}h(\tau)d\tau = H(w_0)e^{jw_0t} $$

  * Discrete:

    $$ y[n] = \sum_{k=-\infty}^{\infty} e^{jw_0(n-k)}h[k] = H(e^{jw_0})e^{jw_0n} $$

  We call $H(w_0)$ the *frequency response* of out LTI system at frequency $w_0$

* **Properties**

  * $x(t) = e^{-jw_0t} = \cos(-w_0t)+j\sin(-w_0t)$ (idem for discrete time)
  
  * When the impulse response $h(t)$ of the system is *real-valued*, the frequency response satifies : $H(w_0) = H^*(-w_0)$. Where $*$ denotes the complex conjugate. One often syas that in thsi case the frequency response is*conjugate-sysmmetric* (idem for discrete time)

* **Convolution** Let us consider two systems with frequency responses $H_1(w)$ and $H_2(w)$ respectively:  
  * Parallel: The overall system has frequency response: $G(w) = H_1(w) + H_2(w)$ (idem for dicrete time)
  * Serie: The overall system has frequency response: $G(w) = H_1(w)H_2(w)$ (idem for discrete time)

* **Sampling** $x_p(t) = x(t)p(t)$ where $p(t) = \sum_{n=-\infty}^{\infty}\delta(t - nY)$. Combining the two first result we have :

  $$ x_p(t) = \sum_{n=-\infty}^{\infty} x(nT)\delta(t-nT) $$

  $$ X_p(\omega) = \frac{1}{T} \sum_{k=-\infty}^{\infty} X(\omega - k\omega_s) $$

  * *Sampling theorem*: Let $x(t)$ be a band-limited signal with $X(w) = 0$ for $|w| > w_m$. Then $x(t)$ is uniquely determined by its samples $x(nT), n=0,\pm1, \pm2, \dots,$ if $w_s > 2w_M$ where $w_s = \frac{2\pi}{T}$. The frequency $2w_M$ is commonly referred as the *Nyquist rate* (The frequency $w_M$ correponding to one-half the Nyquiest rate if often referred to as the *Nyquist frequency*)

* The **reconstrcution** in the time domain becomes :

  $$ x_r(t) = \sum_{n=-\infty}^{\infty} x(nT)\frac{w_cT}{\pi}\frac{\sin_{w_c}(t-nT)}{w_c(t-nT)} $$

  $$ X_r(\omega) = X_p(\omega)H(\omega) $$

# The Transfer Function and The $Z$-Transform

* We define the $Z$-transform as :

  $$ X(z) = \sum_{n=-\infty}^{\infty}x[n]z^{-n} $$

* The signal is *causal* (that is right-sided) it the ROC extends indefinitely outwards

* The signal is *anti-causal* (that is left-sided) if the ROC includes the origin

* The time-domain signal is *stable* (that is absolutely summable) if and only if the ROC includes the *unit-circle. Whenever the ROC inlcudes the unit circle, thsi implies that the discrete-time Fourier transform of the time-domain signal also exists.

* To be a valid ROC we must have:

  * The ROC is either a circle or an annulus (possibly spreading indefinitely) centered at the origin of the $z$-plane.

  * The ROC is bounded by poles or extends to inifinity. It connot contain any poles of $H(z)$

  * The ROC inlcudes the unit circle, then the system is stable

* **Composition** Same as above

@import "Z-transform_Appendix.pdf"

# Transfer Fucntion an The Laplace Transform

* **The Transfer Fucntion** Let us suppoe thath input to out LTI system is gievn by $x(t) = e^{st}$ for an arbitrary *complex-valued* constant $s$. Then, the output is givent by :

  $$ y(t) = \int_{-\infty}^{\infty}e^{s(t-\tau)}h(\tau)d\tau = H(s)e^{st} $$

* **The Laplace Transform** For a time-domain signal $x(t)$, the Laplace transform is defined as :
  
  $$ X(s) = \int_{-\infty}^{\infty}x(t)e^{-st}dt $$

  We observe that by only considering $s$ of the form $s=jw$, that is, by evaluating the Laplace Transform only along the imaginary axis in the complex $s$-plane, we obtain exactly the Fourier transform. In this sense, the Lapalce Trasnform is a strcit generalization of the Fourier transform

* The signal is **causal** (that is rigth sided) if the ROC extends indefinitely to the rigth

* The signal is **anti-causal** (that is left sided) if the ROC extends indefinitely to the left

* The time-domain signal is **stable** (that is absolutely integrable) if and only if ROC includes the *imaginary axis*. Whenever the ROC included the imaginary axis, this implies that Fourier transform of the time-domain signal also exists

* TO be a valid ROC we must have:

  * The ROC consists of strips parallel to the $jw$-axis in the $s$-plane

  * The ROC in bounded by poles or extends to infinity. It cannot contain any poles.

  * If the ROC includes the imaginary axis, then the signal is stable

* **Composition** same as above

@import "Laplace_Appendix.pdf"

# Example

* **Non time invariant** :

  $$ y[n] = \mathcal{H}(x[n]) = x[x]\cos(\omega_0n) \implies y[n-n_0] = x[n-n_0]\cos(\omega_0(n-n_0)) $$
  $$ \mathcal{H}(x[n-n_0]) = x[n-n_0]\cos(\omega_0n) $$

