function ConsultarNombre() {
    let identificacion = jQuery("#Identificacion").val();
    jQuery.ajax({
        url: "https://apis.gometa.org/cedulas/" + identificacion,
        method: "GET",
        datatype: "json",
        success: function (response) {
            jQuery("#Nombre").val(response.nombre);
        }
    });
}