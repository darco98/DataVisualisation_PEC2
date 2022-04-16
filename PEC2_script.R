library(waffle)
library(spiralize)
# Vector
x <- c('< 59' = 2.821486706, '60 a 79' = 27.71695765, '80 o +' = 69.46155565)

# Waffle chart
waffle(x, rows = 10, flip= TRUE, size=0.5, title= "Muertes en Galicia por Franja de Edad")

install.packages("spiralize")

library("spiralize")

df<- as.data.frame(readxl::read_xlsx("pec2_vis.xlsx", sheet=3))
ymax <- max(df$Muertos)


spiral_initialize_by_time(xlim=c("2021-12-25 00:00:00", "2022-04-03 00:00:00"),
                          unit_on_axis = "days", period="months", 
                          flip="horizontal")

spiral_track(ylim=c(0, ymax*.7),
             background=FALSE, background_gp = gpar(col = NA, fill = NA))
spiral_polygon(x=c(df$Fecha, rev(df$Fecha)),
               y=c(df$Muertos/2, -rev(df$Muertos/2)),
               gp = gpar(col="#d32e2b", fill="#d32e2b50"))
spiral_lines(x=df$Fecha, y=0)
spiral_text(x="2021-12-25", y=8, text="Diciembre 2021",
            facing = "curved_inside", just = "right",
            gp=gpar(cex=1))
spiral_text(x="2022-04-03", y=8, text="Abril 2022",
            facing = "curved_inside", just = "right",
            gp=gpar(cex=1))
