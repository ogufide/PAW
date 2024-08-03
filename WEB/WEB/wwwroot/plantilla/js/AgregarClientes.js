function ConsultarNombre() {
    let identificacion = jQuery("#Nombre").val();
    jQuery.ajax({
        url: "https://apis.gometa.org/cedulas/" + nombre,
        method: "GET",
        datatype: "json",
        success: function (response) {
            jQuery("#Nombre").val(response.nombre);
        }
    });
}