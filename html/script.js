document.addEventListener("DOMContentLoaded", function() {
    PickedCard = []

    // récupère les cartes envoyées par le joueurs
    window.addEventListener("message", function (event) {
        if (event.data.type === "openui") {
            document.body.style.display = "block"
            PickedCard = event.data.cards
            console.log(PickedCard)
            rendercard(PickedCard)
        }
    });

    // Tourne la carte lorsqu'on clique dessus
    window.onclick = e => {
        if (e.target.parentElement.id) {
            target = document.getElementById(e.target.parentElement.id);
            document.getElementById(target.id).classList.toggle('is-flipped');
        }
    }

    // imprime la face sur les cartes en fonction de la carte envoyée par le joueurs
    function rendercard(PickedCard){

        backCard = document.getElementsByClassName("flip-card-back");
        for (var i = 0; i < backCard.length; ++i) {
            item = backCard[i]
            console.log(item.id)
            element = document.getElementById(item.id);

            element.style.backgroundImage = "url(./img/"+ PickedCard[i] +".png)"
        }


    }

    // lorsque le joueur appuie sur la touche espace ou retour, ferme l'interface
    document.addEventListener('keydown', function(event) {

        if(event.keyCode == 8 || event.keyCode == 32) {

            var elements = document.getElementsByClassName("is-flipped");
            while(elements.length > 0){
                elements[0].classList.remove("is-flipped");
            }

            console.log(PickedCard[0])
            document.body.style.display = "none"
            fetch('http://OA_Card/closeui', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                body: JSON.stringify({
                    cards: PickedCard,
                }),
            });
        }
    });
});






