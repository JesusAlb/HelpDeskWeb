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
    
    public partial class tbllugar
    {
        public tbllugar()
        {
            this.tbleventoes = new HashSet<tblevento>();
        }
    
        public int idLugar { get; set; }
        public string nomLugar { get; set; }
    
        public virtual ICollection<tblevento> tbleventoes { get; set; }
    }
}
