﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HelpDeskWeb.EntityFrameWork
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class dbhelpdeskV2Entities : DbContext
    {
        public dbhelpdeskV2Entities()
            : base("name=dbhelpdeskV2Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblarea> tblarea { get; set; }
        public virtual DbSet<tblcalidadservicio> tblcalidadservicio { get; set; }
        public virtual DbSet<tblcoordinacion> tblcoordinacion { get; set; }
        public virtual DbSet<tbldepartamento> tbldepartamento { get; set; }
        public virtual DbSet<tblequipoasignado> tblequipoasignado { get; set; }
        public virtual DbSet<tblestatus> tblestatus { get; set; }
        public virtual DbSet<tblevento> tblevento { get; set; }
        public virtual DbSet<tblincidente> tblincidente { get; set; }
        public virtual DbSet<tblinstitucion> tblinstitucion { get; set; }
        public virtual DbSet<tbllugar> tbllugar { get; set; }
        public virtual DbSet<tblmarca> tblmarca { get; set; }
        public virtual DbSet<tblpregunta> tblpregunta { get; set; }
        public virtual DbSet<tblprioridad> tblprioridad { get; set; }
        public virtual DbSet<tblpuesto> tblpuesto { get; set; }
        public virtual DbSet<tblrecurso> tblrecurso { get; set; }
        public virtual DbSet<tblrecursoasignado> tblrecursoasignado { get; set; }
        public virtual DbSet<tblrespuesta> tblrespuesta { get; set; }
        public virtual DbSet<tblservicio> tblservicio { get; set; }
        public virtual DbSet<tbltipoequipo> tbltipoequipo { get; set; }
        public virtual DbSet<tbltipoevento> tbltipoevento { get; set; }
        public virtual DbSet<tbltipoincidencia> tbltipoincidencia { get; set; }
        public virtual DbSet<tblusuario> tblusuario { get; set; }
        public virtual DbSet<vt_departamentos> vt_departamentos { get; set; }
        public virtual DbSet<vt_encuestas> vt_encuestas { get; set; }
        public virtual DbSet<vt_equipos> vt_equipos { get; set; }
        public virtual DbSet<vt_evento_sin_cerrar> vt_evento_sin_cerrar { get; set; }
        public virtual DbSet<vt_eventos_cerrados> vt_eventos_cerrados { get; set; }
        public virtual DbSet<vt_incidente_sin_cerrar> vt_incidente_sin_cerrar { get; set; }
        public virtual DbSet<vt_incidentes_cerrados> vt_incidentes_cerrados { get; set; }
        public virtual DbSet<vt_preguntas> vt_preguntas { get; set; }
        public virtual DbSet<vt_promedio_eventos> vt_promedio_eventos { get; set; }
        public virtual DbSet<vt_promedio_general> vt_promedio_general { get; set; }
        public virtual DbSet<vt_promedio_incidentes> vt_promedio_incidentes { get; set; }
        public virtual DbSet<vt_recursos_asignados> vt_recursos_asignados { get; set; }
        public virtual DbSet<vt_reporte_equipos> vt_reporte_equipos { get; set; }
        public virtual DbSet<vt_servicios> vt_servicios { get; set; }
        public virtual DbSet<vt_usuarios> vt_usuarios { get; set; }
    
        public virtual int sp_cerrar_evento(Nullable<int> idservicio)
        {
            var idservicioParameter = idservicio.HasValue ?
                new ObjectParameter("idservicio", idservicio) :
                new ObjectParameter("idservicio", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_cerrar_evento", idservicioParameter);
        }
    
        public virtual int sp_cerrar_incidente(Nullable<int> idIncidente, string acciones, string solucion, Nullable<int> idservicio)
        {
            var idIncidenteParameter = idIncidente.HasValue ?
                new ObjectParameter("idIncidente", idIncidente) :
                new ObjectParameter("idIncidente", typeof(int));
    
            var accionesParameter = acciones != null ?
                new ObjectParameter("Acciones", acciones) :
                new ObjectParameter("Acciones", typeof(string));
    
            var solucionParameter = solucion != null ?
                new ObjectParameter("Solucion", solucion) :
                new ObjectParameter("Solucion", typeof(string));
    
            var idservicioParameter = idservicio.HasValue ?
                new ObjectParameter("idservicio", idservicio) :
                new ObjectParameter("idservicio", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_cerrar_incidente", idIncidenteParameter, accionesParameter, solucionParameter, idservicioParameter);
        }
    
        public virtual int sp_insertar_evento(Nullable<int> idevento, string titulo, Nullable<int> lugar, string acomodo, Nullable<int> asistencia, Nullable<System.DateTime> horaIn, Nullable<System.DateTime> horaFn, string descripcion, Nullable<int> tipoEvento, Nullable<int> solicitante, Nullable<System.DateTime> fechaEvento, Nullable<int> idUserNA, Nullable<int> idultimo_servicio)
        {
            var ideventoParameter = idevento.HasValue ?
                new ObjectParameter("idevento", idevento) :
                new ObjectParameter("idevento", typeof(int));
    
            var tituloParameter = titulo != null ?
                new ObjectParameter("titulo", titulo) :
                new ObjectParameter("titulo", typeof(string));
    
            var lugarParameter = lugar.HasValue ?
                new ObjectParameter("lugar", lugar) :
                new ObjectParameter("lugar", typeof(int));
    
            var acomodoParameter = acomodo != null ?
                new ObjectParameter("acomodo", acomodo) :
                new ObjectParameter("acomodo", typeof(string));
    
            var asistenciaParameter = asistencia.HasValue ?
                new ObjectParameter("asistencia", asistencia) :
                new ObjectParameter("asistencia", typeof(int));
    
            var horaInParameter = horaIn.HasValue ?
                new ObjectParameter("horaIn", horaIn) :
                new ObjectParameter("horaIn", typeof(System.DateTime));
    
            var horaFnParameter = horaFn.HasValue ?
                new ObjectParameter("HoraFn", horaFn) :
                new ObjectParameter("HoraFn", typeof(System.DateTime));
    
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("descripcion", descripcion) :
                new ObjectParameter("descripcion", typeof(string));
    
            var tipoEventoParameter = tipoEvento.HasValue ?
                new ObjectParameter("tipoEvento", tipoEvento) :
                new ObjectParameter("tipoEvento", typeof(int));
    
            var solicitanteParameter = solicitante.HasValue ?
                new ObjectParameter("solicitante", solicitante) :
                new ObjectParameter("solicitante", typeof(int));
    
            var fechaEventoParameter = fechaEvento.HasValue ?
                new ObjectParameter("FechaEvento", fechaEvento) :
                new ObjectParameter("FechaEvento", typeof(System.DateTime));
    
            var idUserNAParameter = idUserNA.HasValue ?
                new ObjectParameter("idUserNA", idUserNA) :
                new ObjectParameter("idUserNA", typeof(int));
    
            var idultimo_servicioParameter = idultimo_servicio.HasValue ?
                new ObjectParameter("idultimo_servicio", idultimo_servicio) :
                new ObjectParameter("idultimo_servicio", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_insertar_evento", ideventoParameter, tituloParameter, lugarParameter, acomodoParameter, asistenciaParameter, horaInParameter, horaFnParameter, descripcionParameter, tipoEventoParameter, solicitanteParameter, fechaEventoParameter, idUserNAParameter, idultimo_servicioParameter);
        }
    
        public virtual int sp_insertar_incidente(Nullable<int> idincidente, Nullable<int> solicitante, string descripcion, Nullable<int> idUserNA, Nullable<int> idultimo_servicio, Nullable<int> id_tipoIncidencia_genera)
        {
            var idincidenteParameter = idincidente.HasValue ?
                new ObjectParameter("idincidente", idincidente) :
                new ObjectParameter("idincidente", typeof(int));
    
            var solicitanteParameter = solicitante.HasValue ?
                new ObjectParameter("solicitante", solicitante) :
                new ObjectParameter("solicitante", typeof(int));
    
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("descripcion", descripcion) :
                new ObjectParameter("descripcion", typeof(string));
    
            var idUserNAParameter = idUserNA.HasValue ?
                new ObjectParameter("idUserNA", idUserNA) :
                new ObjectParameter("idUserNA", typeof(int));
    
            var idultimo_servicioParameter = idultimo_servicio.HasValue ?
                new ObjectParameter("idultimo_servicio", idultimo_servicio) :
                new ObjectParameter("idultimo_servicio", typeof(int));
    
            var id_tipoIncidencia_generaParameter = id_tipoIncidencia_genera.HasValue ?
                new ObjectParameter("id_tipoIncidencia_genera", id_tipoIncidencia_genera) :
                new ObjectParameter("id_tipoIncidencia_genera", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_insertar_incidente", idincidenteParameter, solicitanteParameter, descripcionParameter, idUserNAParameter, idultimo_servicioParameter, id_tipoIncidencia_generaParameter);
        }
    
        public virtual ObjectResult<sp_requerimientos_sin_asignar_Result> sp_requerimientos_sin_asignar(Nullable<int> idEvento)
        {
            var idEventoParameter = idEvento.HasValue ?
                new ObjectParameter("idEvento", idEvento) :
                new ObjectParameter("idEvento", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_requerimientos_sin_asignar_Result>("sp_requerimientos_sin_asignar", idEventoParameter);
        }
    }
}
