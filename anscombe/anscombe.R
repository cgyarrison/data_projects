library(tidyverse)
library(patchwork)

anscombe

theme_update(panel.background = element_rect(fill = "#fffb96"),
             axis.line = element_line(color = "black"),
             aspect.ratio = 1/2,
             axis.text = element_text(family = "mono", size = 10),
             plot.background = element_rect(linetype = 0),
             panel.grid = element_blank())

p1 <- anscombe %>% ggplot(aes(x = x1, y = y1,
                              color = x1)) +
  geom_abline(slope = 0.5, intercept = 3,
              color = "orange", linetype = "dashed", size = 1) +
  geom_point(size = 5, show.legend = FALSE) +
  coord_cartesian(xlim = c(0, 20), ylim = c(0, 13.5), expand = FALSE) +
  scale_x_continuous(breaks = c(5, 10, 15, 20),
                     labels = c("", 10, "", 20)) +
  scale_y_continuous(breaks = c(5, 10)) +
  scale_color_gradient(low = "#ff71ce", high = "#01cdfe") +
  labs(x = NULL, y = NULL) +
  annotate("text", x = 2.5, y = 11.5,
           label = "I",
           size = 8,
           family = "mono")

p2 <- anscombe %>% ggplot(aes(x = x2, y = y2,
                              color = x2)) +
  geom_abline(slope = 0.5, intercept = 3,
              color = "orange", linetype = "dashed", size = 1) +
  geom_point(size = 5, show.legend = FALSE) +
  coord_cartesian(xlim = c(0, 20), ylim = c(0, 13.5), expand = FALSE) +
  scale_x_continuous(breaks = c(5, 10, 15, 20),
                     labels = NULL) +
  scale_y_continuous(breaks = c(5, 10),
                     labels = NULL) +
  scale_color_gradient(low = "#ff71ce", high = "#01cdfe") +
  labs(x = NULL, y = NULL) +
  annotate("text", x = 2.5, y = 11.5,
           label = "II",
           size = 8,
           family = "mono")

p3 <- anscombe %>% ggplot(aes(x = x3, y = y3,
                              color = x3)) +
  geom_abline(slope = 0.5, intercept = 3,
              color = "orange", linetype = "dashed", size = 1) +
  geom_point(size = 5, show.legend = FALSE) +
  coord_cartesian(xlim = c(0, 20), ylim = c(0, 13.5), expand = FALSE) +
  scale_x_continuous(breaks = c(5, 10, 15, 20),
                     labels = NULL) +
  scale_y_continuous(breaks = c(5, 10),
                     labels = NULL) +
  scale_color_gradient(low = "#ff71ce", high = "#01cdfe") +
  labs(x = NULL, y = NULL) +
  annotate("text", x = 2.5, y = 11.5,
           label = "III",
           size = 8,
           family = "mono")

p4 <- anscombe %>% ggplot(aes(x = x4, y = y4,
                              color = y4)) +
  geom_abline(slope = 0.5, intercept = 3,
              color = "orange", linetype = "dashed", size = 1) +
  geom_point(size = 5, show.legend = FALSE) +
  coord_cartesian(xlim = c(0, 20), ylim = c(0, 13.5), expand = FALSE) +
  scale_x_continuous(breaks = c(5, 10, 15, 20),
                     labels = NULL) +
  scale_y_continuous(breaks = c(5, 10),
                     labels = NULL) +
  scale_color_gradient(low = "#ff71ce", high = "#01cdfe") +
  labs(x = NULL, y = NULL) +
  annotate("text", x = 2.5, y = 11.5,
           label = "IV",
           size = 8,
           family = "mono")

p <- (p1 + p2) / (p3 + p4)
p + plot_annotation(title = "Anscombe's Quartet") &
  theme(text = element_text(family = "mono", size = 12),
        plot.background = element_rect(fill = "#05ffa1"))

# ggsave("anscombe/anscombe.png", dpi = 600)
