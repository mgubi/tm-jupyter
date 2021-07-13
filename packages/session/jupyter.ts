<TeXmacs|1.99.19>

<style|source>

<\body>
  <active*|<\src-title>
    <src-package|jupyter|1.0>

    <\src-purpose>
      Markup for Jupyter sessions.
    </src-purpose>

    <src-copyright|2021|Jeroen Wouters>

    <\src-license>
      This software falls under the <hlink|GNU general public license,
      version 3 or later|$TEXMACS_PATH/LICENSE>. It comes WITHOUT ANY
      WARRANTY WHATSOEVER. You should have received a copy of the license
      which the software. If not, see <hlink|http://www.gnu.org/licenses/gpl-3.0.html|http://www.gnu.org/licenses/gpl-3.0.html>.
    </src-license>
  </src-title>>

  <assign|jupyter-input|<macro|prompt|body|<with|prog-language|<extern|jupyter-kernel-\<gtr\>language|<value|prog-session>>|<style-with|src-compact|none|<compound|generic-input|<arg|prompt>|<arg|body>>>>>>
</body>

<\initial>
  <\collection>
    <associate|preamble|true>
  </collection>
</initial>