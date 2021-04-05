library(tidyverse)
library(extrafont)

weezer <- data.frame(member = c("a", "b", "c", "d"),
                     height = c(11, 9, 10.2, 9.5),
                     color = c("#faf5bb", "#4c7aed", "pink", "light blue"))

songs <- c("1. My Name Is Jonas",
           "2. No One Else",
           "3. The World Has Turned\nand Left Me Here",
           "4. Buddy Holly",
           "5. Undone \u2014 The\nSweater Song",
           "6. Surf Wax America",
           "7. Say It Ain't So",
           "8. In the Garage",
           "9. Holiday",
           "10. Only in Dreams")

weezer %>% ggplot(aes(x = member, y = height)) +
  geom_col(fill = weezer$color, color = "black") +
  scale_x_discrete() +
  scale_y_continuous(limits = c(0, 18),
                     expand = c(0, 0),
                     breaks = seq(from = 0.5, to = 17.5,
                                  length.out = length(songs)),
                     labels = rev(songs),
                     minor_breaks = NULL) +
  labs(x = NULL, y = NULL) +
  annotate("text", label = "theme_weezer()",
           x = 3.45, y = 18,
           hjust = 0.69, vjust = 1.2,
           size = 13, family = "WeezerFont") +
  theme(panel.background = element_rect(fill = "#0071a5", color = "black"),
        panel.grid.major.y = element_blank(),
        plot.background = element_rect(fill = "linen", color = NA),
        axis.text.y = element_text(family = "mono",
                                   size = 10),
        axis.text.x = element_blank(),
        panel.grid.major.x = element_blank())

ggsave("weezer/weezer2.png", dpi = 600)
