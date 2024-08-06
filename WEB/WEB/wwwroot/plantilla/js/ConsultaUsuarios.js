﻿$(document).ready(function () {
  var table = new DataTable("#tabla-Usuarios", {
    language: {
      url: '//cdn.datatables.net/plug-ins/2.0.2/i18n/es-ES.json'
    },
    columnDefs: [{ type: 'string', target: [0] }]
  });
});

$(document).on("click", ".Modales", function () {

    $("#Identificacion").val($(this).attr("data-id"));
    $("#Nombre").text($(this).attr("data-name"));

});