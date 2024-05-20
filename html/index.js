$(function () {
    function display(bool) {
        if (bool) {
            $(".h-eyes").show();
        } else {
            $(".h-eyes").hide();
        }
    }

    display(false);

    function display2(bool) {
        if (bool) {
            $(".h").show();
        } else {
            $(".h").hide();
        }
    }

    display2(false);

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "H_market_eays") {
            display(item.status);
        } else if (item.type === "H_market_test") {
            display2(item.status);
        }
    });

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://H_market_test/close', JSON.stringify({}));
            return;
        }
    };

    $("#close").click(function () {
        $.post('https://H_market_test/close', JSON.stringify({}));
        return;
    });

    function buyItem(item) {
        $.post('https://H_market_test/buyItem', JSON.stringify({ item: item }));
    }

    $("#pizza").click(function () {
        buyItem("pizza");
        return;
    });

    $("#pepsi").click(function () {
        buyItem("pepsi");
        return;
    });

    $("#hamburger").click(function () {
        buyItem("hamburger");
        return;
    });

    $("#red-bull").click(function () {
        buyItem("red-bull");
        return;
    });

    $("#pasta").click(function () {
        buyItem("pasta");
        return;
    });

    $("#water").click(function () {
        buyItem("water");
        return;
    });

    $("#shawarma").click(function () {
        buyItem("shawarma");
        return;
    });

    $("#juice").click(function () {
        buyItem("juice");
        return;
    });

    $("#cupcake").click(function () {
        buyItem("cupcake");
        return;
    });

    $("#ice-cream").click(function () {
        buyItem("ice-cream");
        return;
    });

    $("#cheesecake").click(function () {
        buyItem("cheesecake");
        return;
    });

    $("#macaron").click(function () {
        buyItem("macaron");
        return;
    });
});