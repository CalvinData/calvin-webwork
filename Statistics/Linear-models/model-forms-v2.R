library(tidyverse)
library(ggformula)
library(patchwork)
theme_set(theme_bw())
Data <-
  tibble(
    x = c(1:5, c(5.8, 6.2, 7:11) - 4),
    y = c(c(5, 6.1, 6.3, 7.5, 7.8, 7.6), c(6.6, 5.5, 6.2, 5, 3.9, 4.0) + 0.4),
    group = rep(c("A", "B"), c(6, 6))
  ) |>
  expand(
    model = 1:6,
    nesting(x, y, group)
  )




model1 <- lm(y ~ 1, data = Data)
model2 <- lm(y ~ x + group, data = Data)
model3 <- lm(y ~ x, data = Data)
model4 <- lm(y ~ -1 + x, data = Data)
model5 <- lm(y ~ group, data = Data)
model6 <- lm(y ~ x * group, data = Data)

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
png(width = 600, height = 400, "model-forms-v2.png")
p
dev.off()

p


