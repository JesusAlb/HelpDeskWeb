//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HelpDeskWeb.Modelo
{
    using System;
    using System.Collections.Generic;
    
    public partial class VistaEncuesta
    {
        public Nullable<long> numPregunta { get; set; }
        public int idPregunta { get; set; }
        public string txtPregunta { get; set; }
        public bool statusPregunta { get; set; }
        public int afinidad { get; set; }
        public int valorRespuesta { get; set; }
        public int idCalidad_Servicio { get; set; }
        public string observacionesServicio { get; set; }
        public bool statusCal_Servicio { get; set; }
        public Nullable<int> incidente { get; set; }
        public Nullable<int> evento { get; set; }
    }
}
