//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FloorMaster.DataBase
{
    using System;
    using System.Collections.Generic;
    
    public partial class ContactInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ContactInfo()
        {
            this.Company = new HashSet<Company>();
        }
    
        public int Id { get; set; }
        public int ContactInfoTypeId { get; set; }
        public string ContactInfo1 { get; set; }
    
        public virtual ContactInfoType ContactInfoType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Company> Company { get; set; }
    }
}
