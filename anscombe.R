library(tidyverse)
library(patchwork)

anscombe

anscombe1 <- anscombe %>% 
  select(x1, y1)
anscombe2 <- anscombe %>% 
  select(x2, y2)
anscombe3 <- anscombe %>% 
  select(x3, y3)
anscombe4 <- anscombe %>% 
  select(x4, y4)

anscombe1$set <- "Anscombe 1"
anscombe2$set <- "Anscombe 2"
anscombe3$set <- "Anscombe 3"
anscombe4$set <- "Anscombe 4"

names(anscombe1)[1] <- "x"
names(anscombe2)[1] <- "x"
names(anscombe3)[1] <- "x"
names(anscombe4)[1] <- "x"

names(anscombe1)[2] <- "y"
names(anscombe2)[2] <- "y"
names(anscombe3)[2] <- "y"
names(anscombe4)[2] <- "y"

anscombe_long <- rbind(anscombe1, anscombe2, anscombe3, anscombe4)
anscombe_long

anscombe_long %>% ggplot(aes(x = x, y = y, color = set)) +
  geom_point()

anscombe_long %>% ggplot(aes(x = x, y = y, color = set)) +
  geom_smooth(se = FALSE, method = "lm", color = "orange") +
  geom_point(show.legend = FALSE) +
  facet_wrap(.~set, nrow = 2)

p1 <- anscombe1 %>% ggplot(aes(x = x, y = y,
                               color = x)) +
  geom_abline(slope = 0.5, intercept = 3,
              color = "orange", linetype = "dashed", size = 1) +
  geom_point(size = 5, show.legend = FALSE) +
  coord_cartesian(xlim = c(0, 20), ylim = c(0, 13.5), expand = FALSE) +
  scale_x_continuous(breaks = c(5, 10, 15, 20),
                     labels = c("", 10, "", 20)) +
  scale_y_continuous(breaks = c(5, 10)) +
  scale_color_gradient(low = "#ff71ce", high = "#01cdfe") +
  labs(x = NULL, y = NULL) +
  theme(panel.background = element_rect(fill = "#fffb96"),
        axis.line = element_line(color = "black"),
        aspect.ratio = 1/2,
        axis.text = element_text(family = "mono", size = 10),
        plot.background = element_rect(linetype = 0),
        panel.grid = element_blank()) +
  annotate("text", x = 2.5, y = 11.5,
           label = "I",
           size = 8,
           family = "mono")

(p1 + p1) / (p1 + p1)

p2 <- anscombe2 %>% ggplot(aes(x = x, y = y, color = x)) +
  geom_abline(slope = 0.5, intercept = 3,
              color = "orange", linetype = "dashed", size = 1) +
  geom_point(size = 5, show.legend = FALSE) +
  coord_cartesian(xlim = c(0, 20), ylim = c(0, 13.5), expand = FALSE) +
  scale_x_continuous(breaks = c(5, 10, 15, 20),
                     labels = NULL) +
  scale_y_continuous(breaks = c(5, 10), labels = NULL) +
  scale_color_gradient(low = "#ff71ce", high = "#01cdfe") +
  labs(x = NULL, y = NULL) +
  theme(panel.background = element_rect(fill = "#fffb96"),
        axis.line = element_line(color = "black"),
        aspect.ratio = 1/2,
        axis.text = element_text(family = "mono", size = 10),
        plot.background = element_rect(linetype = 0),
        panel.grid = element_blank()) +
  annotate("text", x = 2.5, y = 11.5,
           label = "II",
           size = 8,
           family = "mono")

(p1 + p2) / (p1 + p1)

p3 <- anscombe3 %>% ggplot(aes(x = x, y = y, color = x)) +
  geom_abline(slope = 0.5, intercept = 3,
              color = "orange", linetype = "dashed", size = 1) +
  geom_point(size = 5, show.legend = FALSE) +
  coord_cartesian(xlim = c(0, 20), ylim = c(0, 13.5), expand = FALSE) +
  scale_x_continuous(breaks = c(5, 10, 15, 20),
                     labels = NULL) +
  scale_y_continuous(breaks = c(5, 10), labels = NULL) +
  scale_color_gradient(low = "#ff71ce", high = "#01cdfe") +
  labs(x = NULL, y = NULL) +
  theme(panel.background = element_rect(fill = "#fffb96"),
        axis.line = element_line(color = "black"),
        aspect.ratio = 1/2,
        axis.text = element_text(family = "mono", size = 10),
        plot.background = element_rect(linetype = 0),
        panel.grid = element_blank()) +
  annotate("text", x = 2.5, y = 11.5,
           label = "III",
           size = 8,
           family = "mono")

(p1 + p2) / (p3 + p1)

p4 <- anscombe4 %>% ggplot(aes(x = x, y = y, color = y)) +
  geom_abline(slope = 0.5, intercept = 3,
              color = "orange", linetype = "dashed", size = 1) +
  geom_point(size = 5, show.legend = FALSE) +
  coord_cartesian(xlim = c(0, 20), ylim = c(0, 13.5), expand = FALSE) +
  scale_x_continuous(breaks = c(5, 10, 15, 20),
                     labels = NULL) +
  scale_y_continuous(breaks = c(5, 10), labels = NULL) +
  scale_color_gradient(low = "#ff71ce", high = "#01cdfe") +
  labs(x = NULL, y = NULL) +
  theme(panel.background = element_rect(fill = "#fffb96"),
        axis.line = element_line(color = "black"),
        aspect.ratio = 1/2,
        axis.text = element_text(family = "mono", size = 10),
        plot.background = element_rect(linetype = 0),
        panel.grid = element_blank()) +
  annotate("text", x = 2.5, y = 11.5,
           label = "IV",
           size = 8,
           family = "mono")

p <- (p1 + p2) / (p3 + p4)
p + plot_annotation(title = "Anscombe's Quartet") &
  theme(text = element_text(family = "mono", size = 12),
        plot.background = element_rect(fill = "#05ffa1"))

ggsave("anscombe.png", dpi = 600)
