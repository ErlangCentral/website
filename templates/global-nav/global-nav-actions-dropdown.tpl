<div id="global_van_dropdown" class="global-nav__actions__dropdown form__page" style="display:none;">
    <div id="login" class="global-nav__actions__dropdown__block" style="display:none;">
        {% include "_logon_modal.tpl" logon_state=tab page=redirect %}
    </div>
    <div id="logout" class="global-nav__actions__dropdown__block" style="display:none;">
        {% include "dialog-profile/dialog-profile.tpl" %}
    </div>
</div>

{% javascript %}
    var dropdown = document.getElementById('global_van_dropdown');
    if(checkVisible(dropdown)) {
        document.addEventListener("click", function(e){
            if(e.target != dropdown && e.target.className && dropdown.querySelectorAll('.'+e.target.className.split(' ')[0]).length == 0) {
                dropdown.style.display = 'none';
            }
        });
    }

    function checkVisible(element) {
        return element.style.display === 'block';
    }
{% endjavascript %}
