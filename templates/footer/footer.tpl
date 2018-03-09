<footer class="main-footer">
    <div class="main-footer__container">
        {% menu menu_id=m.rsc.footer_menu.id id=footer_menu context=context menu_class="main-footer__nav" %}

        <div class="main-footer__column">
            <h3>Stay updated</h3>
            <p>Keep up with the latest Erlang news, events and jobs</p>
            <br>
            <form class="form__footer" action="">
                <div class="input__wrapper">
                    <input type="text" placeholder="your email" >
                    <input class="btn-default" type="submit" value="ok">
                </div>
            </form>
        </div>

        {% include "footer/footer-social.tpl" %}
    </div>
</footer>
