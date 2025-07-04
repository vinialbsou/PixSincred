@if (!env('HIDE_FOOTER'))
<footer class="footer "
    style="height:auto;background-color: #000;margin-top:0px!important; text-align: center;">
    @if (env('Expressão Digital'))
        <a href="https://link.expressaodigital.com/" target="_blank" style="text-decoration: none"><span
                class="text-muted" style="color: #fff!important; font-size: 12px;">Customizado por Expressão Digital</span></a>
        </div>
    @else
        <a href="https://link.expressaodigital.com/" target="_blank" style="text-decoration: none"><span
                class="text-muted" style="color: #fff!important; font-size: 12px;">Customizado por Expressão Digital</span></a>
        </div>
    @endif
</footer>
@endif