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
    
    public partial class tblcoordinacion
    {
        public tblcoordinacion()
        {
            this.tbldepartamentos = new HashSet<tbldepartamento>();
        }
    
        public int idCoordinacion { get; set; }
        public string nomCoordinacion { get; set; }
    
        public virtual ICollection<tbldepartamento> tbldepartamentos { get; set; }
    }
}
