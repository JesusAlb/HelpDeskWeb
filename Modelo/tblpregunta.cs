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
    
    public partial class tblpregunta
    {
        public tblpregunta()
        {
            this.tblrespuestas = new HashSet<tblrespuesta>();
        }
    
        public int idPregunta { get; set; }
        public string txtPregunta { get; set; }
        public bool statusPregunta { get; set; }
        public int afinidad { get; set; }
    
        public virtual ICollection<tblrespuesta> tblrespuestas { get; set; }
    }
}
