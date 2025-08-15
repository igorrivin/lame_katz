# Lamé \(p\)-curvature (equianharmonic) — mini bundle

This bundle contains a concise LaTeX note and a Sage script that checks whether the \(p\)-curvature vanishes for the Lamé equation
\[
(4z^3-1)\,y'' + 6z^2\,y' - \mu z\,y = 0,\qquad \mu = n(n+1)=\frac{5}{87}\Bigl(\frac{5}{87}+1\Bigr) = \frac{460}{7569},
\]
i.e. for the parameters \((n,B,g_2,g_3)=\bigl(\frac{5}{87},0,0,1\bigr)\).

The computation is done on the elliptic curve \(E: y^2=4x^3-1\) (the equianharmonic \(j=0\) case) using the vector field
\(\nu = y\,\partial_x + 6x^2\,\partial_y\) and the first‑order system
\(
dY = \begin{pmatrix}0 & \omega \\ \mu x\,\omega & 0\end{pmatrix} Y
\)
with \(\omega=dx/y\).
For a good prime \(p\ge 5,\ p\neq 29\), the \(p\)-curvature along \(\nu\) is
\(\psi_p(\nu) = A_p(\nu) - \alpha_p A(\nu)\),
where \(A_{k+1} = \nu(A_k) + A_k A\) with \(A_1=A\), and \(\alpha_p\) is the Hasse–Witt invariant (Cartier on \(\omega\)).

## Contents

- `tex/main.tex` — a short write‑up (build with `pdflatex main.tex`).
- `code/lame_pcurvature.sage` — Sage program that tests primes up to a bound.
- `Makefile` — convenience targets (`make pdf`, `make scan`).
- `LICENSE` — MIT.

## Quick start

1. **Build the PDF (optional):**
   ```bash
   cd tex
   pdflatex main.tex
   ```

2. **Run the Sage script:**
   ```bash
   cd code
   sage lame_pcurvature.sage --bound 200 --alpha binomial --list both
   ```

   Options:
   - `--bound N` : test primes \(5 \le p \le N\), skipping \(p=29\).
   - `--alpha {binomial,coeff}` : compute \(\alpha_p\) either by the closed binomial formula (fast) or by coefficient extraction (robust).
   - `--list {good,bad,both}` : print primes with vanishing (\*good\*) or non‑vanishing (\*bad\*) \(p\)-curvature (or both).

> **Note on performance.** This is a transparent, textbook implementation via the recursion \(A_{k+1}=\nu(A_k)+A_kA\), so runtime grows roughly linearly with \(p\). It’s perfect for modest bounds (hundreds or a few thousands). For very large bounds, consider specialized \(p\)-curvature algorithms.

## Expected behavior

- Finite‑monodromy cases give density \(1\) of vanishing \(p\)-curvature (not our \(n\)).
- For the present \(n=\frac{5}{87}\), numerical scans will typically show many early vanishing \(p\)'s but also infinitely many non‑vanishing ones, consistent with conjectural **density 0**.

Enjoy, and feel free to tweak the script as needed.
