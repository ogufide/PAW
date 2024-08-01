
$(document).ready(function () {
    var table = new DataTable("#tabla-Clientes", {
        language: {
            url: '//cdn.datatables.net/plug-ins/2.0.2/i18n/es-ES.json'
        },
        columnDefs: [{ type: 'string', target: [0] }]
    });
});

$(document).ready(function () {
    var table = new DataTable("#tabla-Empleados", {
        language: {
            url: '//cdn.datatables.net/plug-ins/2.0.2/i18n/es-ES.json'
        },
        columnDefs: [{ type: 'string', target: [0] }]
    });
});

$(document).ready(function () {
    var table = new DataTable("#tabla-Gimnasios", {
        language: {
            url: '//cdn.datatables.net/plug-ins/2.0.2/i18n/es-ES.json'
        },
        columnDefs: [{ type: 'string', target: [0] }]
    });
});

