function openPopup(file, name) {
    window.open(file, name, 'width=500,height=600'); 
}

function closePopup() {
    window.close(); 
}

function scrollToDiv(targetDivID) {
    const targetDiv = document.getElementById(targetDivID);
    targetDiv.scrollIntoView({ behavior: 'smooth' }); 
}

function openTab(evt, tabName) {
    var tabcontent = document.getElementsByClassName("tabcontent");
    for (var i = 0; i < tabcontent.length; i++) {
        tabcontent[i].classList.remove("active");
    }

    var tablinks = document.getElementsByClassName("tablinks");
    for (var i = 0; i < tablinks.length; i++) {
        tablinks[i].classList.remove("active");
    }

    var currentTab = document.getElementById(tabName);
    if (currentTab) { 
        currentTab.classList.add("active");
    }

    evt.currentTarget.classList.add("active");
}
