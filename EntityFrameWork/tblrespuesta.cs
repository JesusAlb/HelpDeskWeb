//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HelpDeskWeb.EntityFrameWork
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblrespuesta
    {
        public int id { get; set; }
        public int valor { get; set; }
        public int fk_idpregunta { get; set; }
        public int fk_idcalidad { get; set; }
    
        public virtual tblcalidadservicio tblcalidadservicio { get; set; }
        public virtual tblpregunta tblpregunta { get; set; }
    }
}
