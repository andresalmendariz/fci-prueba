
library(DBI)
library(RPostgres)

#conexion a la base
conn=dbConnect(RPostgres :: Postgres (),host="52.38.27.79",port="5432",dbname="datos_gye",user="postgres",password="admin1234")

#extraer los datos
rf14=dbGetQuery(conn,"SELECT latitud,longitud FROM public.trayectoria_gye_hist")
#agrupar los datos
datos<-rbind(rf14)
#generar analisis kmeans
kmeans.res<-kmeans(datos,center=1)
#guardar imagen
jpeg("C:/Users/jcheverria/Desktop/Jorge Cheverria/fci/prueba/public/img/images/analisis2.jpeg", width = 800, height = 600)
#jpeg("/home/kbaque/Archivos Kev/UG/Tesis/fci/public/img/images/analisis2.jpeg", width = 800, height = 600)
#realiza el grafico
plot(datos,col=kmeans.res$cluster)
#pinta el cluster
points(kmeans.res$centers,cex=2,col=11,pch=19)
dev.off()
