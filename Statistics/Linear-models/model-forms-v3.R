library(tidyr)
library(dplyr)
library(ggformula)
library(patchwork)
theme_set(theme_bw())
Data <-
  tibble(
    a = rep(0:1, each = 10),
    x = rep(0:9, times = 2),
    y = -5 + 3*x - 2 * a * x + rnorm(20, sd = 2),
    group = LETTERS[a + 1]
  ) |>
  tidyr::expand(
    model = 1:6,
    nesting(x, y, group)
  )




model1 <- lm(y ~ 1, data = Data)
model2 <- lm(y ~ x + group, data = Data)
model3 <- lm(y ~ x, data = Data)
model4 <- lm(y ~ -1 + x, data = Data)
model6 <- lm(y ~ group, data = Data)
model5 <- lm(y ~ x * group, data = Data)

Data <-
  Data |>
  mutate(
    fit = case_when(
      model == 1 ~ fitted(model1),
      model == 2 ~ fitted(model2),
      model == 3 ~ fitted(model3),
      model == 4 ~ fitted(model4),
      model == 5 ~ fitted(model5),
      model == 6 ~ fitted(model6)
      )
  ) |>
  mutate(label = paste("Graph", model))


p <-
  gf_point(y ~ x, data = Data, color = ~ group) |>
  gf_line(fit ~ x, size = ~ group, alpha = 0.6) |>
  gf_facet_wrap( ~ label, ncol = 3) |>
  gf_refine(
    scale_size_manual(values = c(1.2, 0.6)),
    scale_color_viridis_d(begin = 0.7, end = 0.2)
    )
png(width = 600, height = 400, "model-forms-v3.png")
p
dev.off()

p


