data {
  int<lower=1> N;  // Number of observations
  vector[N] y;     // Outcome variable
  vector[N] x;     // Binary predictor (0 or 1)
}

parameters {
  real alpha;      // Intercept (mean of group where x = 0)
  real beta;       // Effect of x (difference between groups)
  real<lower=0> sigma;  // Standard deviation
}

model {
  // Likelihood: Normal regression model
  y ~ normal(alpha + beta * x, sigma);
  
  // Priors
  alpha ~ normal(0, 10);  // Prior for intercept
  beta ~ normal(0, 10);   // Prior for effect of x
  sigma ~ normal(0, 10);  // Prior for standard deviation
}
