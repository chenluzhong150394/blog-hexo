<script async src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#

#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} – {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || author }}</span>

  {% if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>
    {% endif %}
    <span title="{{ __('symbols_count_time.count_total') }}">{#
    #}{{ symbolsCountTotal(site) }}{#
  #}</span>
  {% endif %}

  {% if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total')}} &asymp;</span>
    {% endif %}
    <span title="{{ __('symbols_count_time.time_total') }}">{#
    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}{#
  #}</span>
  {% endif %}
</div>

{% if theme.footer.powered.enable %}

  <div class="powered-by">
  {{ __('footer.powered', next_url('https://www.xianglinhu.com', 'hexo', {class: 'theme-link'})) }}
  {% if theme.footer.powered.version %} v{{ hexo_env('version') }}{% endif %}
</div>
{% endif %}

{% if theme.footer.powered.enable and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{% endif %}

{% if theme.footer.theme.enable %}
  <div class="theme-info">
  {{ __('footer.theme') }} – {{ next_url('https://theme-next.org', 'NexT.' + theme.scheme, {class: 'theme-link'}) }}
  {% if theme.footer.theme.version %} v{{ version }}{% endif %}
</div>
{% endif %}

{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}

{% if theme.footer.beian.enable %}
  <div>
    {{ next_url('http://www.miitbeian.gov.cn', theme.footer.beian.icp) }}

    <span class="post-meta-divider">|</span>

    <img src="/images/beian_logo.png" style="display:inline-block;text-decoration:none;height:13px;" />

    {{ next_url('http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=公安备案号', theme.footer.beian.gongan) }}

  </div>

<!-- 新增访客统计代码 -->

<div class="busuanzi-count">
    <script async="" src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
    <span class="site-uv">
      <i class="fa fa-user"></i>
      访问用户： <span class="busuanzi-value" id="busuanzi_value_site_uv"></span> 人
    </span>
    <div class="powered-by"></div>
    <span class="site-uv">
      <i class="fa fa-eye"></i>
      访问次数： <span class="busuanzi-value" id="busuanzi_value_site_pv"></span> 次
    </span>
    <!-- 博客字数统计 -->
    <span class="site-pv">
      <i class="fa fa-pencil"></i>
      博客全站共： <span class="post-count">{{ totalcount(site) }}</span> 字
    </span>
</div>
<!-- 新增访客统计代码 END-->


{% endif %}



