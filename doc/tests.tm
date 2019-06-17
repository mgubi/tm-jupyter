<TeXmacs|1.99.9>

<style|generic>

<\body>
  <\wide-tabular>
    <tformat|<cwith|1|1|1|1|cell-lsep|.3em>|<cwith|1|1|1|1|cell-rsep|.3em>|<cwith|1|1|1|1|cell-bsep|.3em>|<cwith|1|1|1|1|cell-tsep|.3em>|<cwith|1|1|1|1|cell-background|pastel
    orange>|<table|<row|<\cell>
      Some test for the <name|Jupyter> session, for the moment using the
      <name|IPython> kernel.
    </cell>>>>
  </wide-tabular>

  \;

  <with|font-series|bold|TODO>

  <\itemize-dot>
    <item>Loot at <hlink|jupyter-matplotlib|https://github.com/matplotlib/jupyter-matplotlib>
    for examples of interactive code we could support.

    <item>PS image output still does not work from matplotlib. Try to
    understand what really happens in IPython<text-dots>

    <item>History and command completion are not yet implemented.

    <item>Tracebacks and shell commands returns ANSI colored text, we need to
    override this or parse it correctly.

    <item>We would like to have syntax-coloring for the code, maybe direclty
    supported from the Jupyter kernel (e.g. IPython) since we do not want to
    implement all the possible syntax coloring ourselves (but this could have
    the advantage to be available offline)
  </itemize-dot>

  \;

  <\session|jupyter|default>
    <\output>
      Jupyter console 0.1.0dev

      \;

      Python 3.7.3 (default, Mar 27 2019, 09:23:15)\ 

      Type 'copyright', 'credits' or 'license' for more information

      IPython 7.5.0 -- An enhanced Interactive Python. Type '?' for help.
    </output>

    <\unfolded-io>
      In [1]:\ 
    <|unfolded-io>
      ## this shows ASCII codes we still not handle correctly

      !ls
    <|unfolded-io>
      [34m3rdparty[m[m \ \ \ \ \ \ Makefile.in \ \ \ [34mbenchmark[m[m
      \ \ \ \ \ [31mconfigure[m[m \ \ \ \ \ [34msrc[m[m

      CMakeLists.txt README.md \ \ \ \ \ [34mcmake[m[m
      \ \ \ \ \ \ \ \ \ configure.in \ \ [34mtests[m[m

      COMPILE \ \ \ \ \ \ \ SVNREV \ \ \ \ \ \ \ \ [31mconfig.guess[m[m
      \ \ [31minstall-sh[m[m

      COPYING \ \ \ \ \ \ \ TODO \ \ \ \ \ \ \ \ \ \ config.log
      \ \ \ \ [34mmisc[m[m

      LICENSE \ \ \ \ \ \ \ [34mTeXmacs[m[m
      \ \ \ \ \ \ \ [31mconfig.status[m[m \ [34mpackages[m[m

      Makefile \ \ \ \ \ \ aclocal.m4 \ \ \ \ [31mconfig.sub[m[m
      \ \ \ \ [34mplugins[m[m
    </unfolded-io>

    <\unfolded-io>
      In [2]:\ 
    <|unfolded-io>
      <\code>
        ## we can write directly to stdout

        print("hi, stdout")
      </code>
    <|unfolded-io>
      hi, stdout
    </unfolded-io>

    <\unfolded-io>
      In [4]:\ 
    <|unfolded-io>
      ## we can write directly to stderr

      import sys

      print('hi, stderr', file=sys.stderr)
    <|unfolded-io>
      <\errput>
        hi, stderr
      </errput>
    </unfolded-io>

    <\unfolded-io>
      In [5]:\ 
    <|unfolded-io>
      ## what about multiple delayed output??

      import time, sys

      for i in range(8):

      \ \ \ \ print(i)

      \ \ \ \ time.sleep(0.5)
    <|unfolded-io>
      0

      1

      2

      3

      4

      5

      6

      7
    </unfolded-io>

    <\unfolded-io>
      In [1]:\ 
    <|unfolded-io>
      <\code>
        import matplotlib

        matplotlib.use('PS') \ \ # generate postscript output by default

        import matplotlib.pyplot as plt

        import numpy as np

        \;
      </code>
    <|unfolded-io>
      <\errput>
        {'header': {'msg_id': '294df570-a7604fe99d22454db55e15b9',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 631823, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '294df570-a7604fe99d22454db55e15b9', 'msg_type': 'status',
        'parent_header': {'msg_id': 'b8089324-4c1de77570fe55d5f605a9c8',
        'msg_type': 'kernel_info_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 41, 312403, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'busy'}, 'buffers':
        []}

        {'header': {'msg_id': '9ecf7aa5-2743b7335cd5eef9d40e73ec',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 634490, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '9ecf7aa5-2743b7335cd5eef9d40e73ec', 'msg_type': 'status',
        'parent_header': {'msg_id': 'b8089324-4c1de77570fe55d5f605a9c8',
        'msg_type': 'kernel_info_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 41, 312403, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'idle'}, 'buffers':
        []}

        {'header': {'msg_id': 'e3e72450-50f9095be37bcf4d6abc29fb',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 637696, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': 'e3e72450-50f9095be37bcf4d6abc29fb', 'msg_type': 'status',
        'parent_header': {'msg_id': '44bf248a-554cacda2d81ed719eeca7ca',
        'msg_type': 'kernel_info_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 41, 315539, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'busy'}, 'buffers':
        []}

        {'header': {'msg_id': '186b8b71-c27d08d6698a4f8f986dc26c',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 640108, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '186b8b71-c27d08d6698a4f8f986dc26c', 'msg_type': 'status',
        'parent_header': {'msg_id': '44bf248a-554cacda2d81ed719eeca7ca',
        'msg_type': 'kernel_info_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 41, 315539, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'idle'}, 'buffers':
        []}

        {'header': {'msg_id': 'c34e2fb5-155d24f6d720e3550b266d9e',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 643944, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': 'c34e2fb5-155d24f6d720e3550b266d9e', 'msg_type': 'status',
        'parent_header': {'msg_id': 'ee745461-e3888fcb6d44e2a1b1054a42',
        'msg_type': 'history_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 642228, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'busy'}, 'buffers':
        []}

        {'header': {'msg_id': 'd524b283-e997ed594100e714955aa288',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 652139, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': 'd524b283-e997ed594100e714955aa288', 'msg_type': 'status',
        'parent_header': {'msg_id': 'ee745461-e3888fcb6d44e2a1b1054a42',
        'msg_type': 'history_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 642228, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'idle'}, 'buffers':
        []}

        {'header': {'msg_id': '8f35cf69-383b2c84d363bccd1a3bc013',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 706180, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '8f35cf69-383b2c84d363bccd1a3bc013', 'msg_type': 'status',
        'parent_header': {'msg_id': 'c4bf032b-3f630c66d60a9ff559b8836f',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 704165, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'busy'}, 'buffers':
        []}

        {'header': {'msg_id': 'b4e3988c-b21441982fd28e59ca49c530',
        'msg_type': 'execute_input', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 706873, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': 'b4e3988c-b21441982fd28e59ca49c530', 'msg_type':
        'execute_input', 'parent_header': {'msg_id':
        'c4bf032b-3f630c66d60a9ff559b8836f', 'msg_type': 'execute_request',
        'username': 'mgubi', 'session': 'c3870339-7d48ea325f778b60fba909c3',
        'date': datetime.datetime(2019, 6, 17, 15, 24, 42, 704165,
        tzinfo=tzutc()), 'version': '5.3'}, 'metadata': {}, 'content':
        {'code': "import matplotlib\\nmatplotlib.use('PS') \ \ # generate
        postscript output by default\\nimport matplotlib.pyplot as
        plt\\nimport numpy as np", 'execution_count': 1}, 'buffers': []}

        {'header': {'msg_id': '2c7aa96e-6be896cd516541a70b86a1fd',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 43, 535942, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '2c7aa96e-6be896cd516541a70b86a1fd', 'msg_type': 'status',
        'parent_header': {'msg_id': 'c4bf032b-3f630c66d60a9ff559b8836f',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 42, 704165, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'idle'}, 'buffers':
        []}
      </errput>
    </unfolded-io>

    <\unfolded-io>
      In [2]:\ 
    <|unfolded-io>
      fig = plt.figure() \ # an empty figure with no axes

      fig.suptitle('No axes on this figure') \ # Add a title so we know which
      it is

      \;

      fig, ax_lst = plt.subplots(2, 2) \ # a figure with a 2x2 grid of Axes
    <|unfolded-io>
      <\errput>
        {'header': {'msg_id': '4d88f629-0c374bd5897a6ead28c58624',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 45, 469227, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '4d88f629-0c374bd5897a6ead28c58624', 'msg_type': 'status',
        'parent_header': {'msg_id': '87b368e9-d9c15ea1e77a6f2d965f3ba2',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 45, 468254, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'busy'}, 'buffers':
        []}

        {'header': {'msg_id': 'f1563d87-620db945c6ffc61acf4fdc5e',
        'msg_type': 'execute_input', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 45, 469435, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': 'f1563d87-620db945c6ffc61acf4fdc5e', 'msg_type':
        'execute_input', 'parent_header': {'msg_id':
        '87b368e9-d9c15ea1e77a6f2d965f3ba2', 'msg_type': 'execute_request',
        'username': 'mgubi', 'session': 'c3870339-7d48ea325f778b60fba909c3',
        'date': datetime.datetime(2019, 6, 17, 15, 24, 45, 468254,
        tzinfo=tzutc()), 'version': '5.3'}, 'metadata': {}, 'content':
        {'code': "fig = plt.figure() \ # an empty figure with no
        axes\\nfig.suptitle('No axes on this figure') \ # Add a title so we
        know which it is\\nfig, ax_lst = plt.subplots(2, 2) \ # a figure with
        a 2x2 grid of Axes", 'execution_count': 2}, 'buffers': []}

        {'header': {'msg_id': '25e1afdb-bead81c58603bf09dd334550',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 45, 516856, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '25e1afdb-bead81c58603bf09dd334550', 'msg_type': 'status',
        'parent_header': {'msg_id': '87b368e9-d9c15ea1e77a6f2d965f3ba2',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 24, 45, 468254, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'idle'}, 'buffers':
        []}
      </errput>
    </unfolded-io>

    <\unfolded-io>
      In [3]:\ 
    <|unfolded-io>
      x = np.linspace(0, 2, 100)

      \;

      plt.plot(x, x, label='linear')

      plt.plot(x, x**2, label='quadratic')

      plt.plot(x, x**3, label='cubic')

      \;

      plt.xlabel('x label')

      plt.ylabel('y label')

      \;

      plt.title("Simple Plot")

      \;

      plt.legend()

      \;

      plt.show()
    <|unfolded-io>
      <\errput>
        {'header': {'msg_id': '7aadd7a5-bcddda973c6b2a34fba514e6',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 25, 25, 796688, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '7aadd7a5-bcddda973c6b2a34fba514e6', 'msg_type': 'status',
        'parent_header': {'msg_id': '98026e92-79cb3634ae3be2e314a81649',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 25, 25, 795737, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'busy'}, 'buffers':
        []}

        {'header': {'msg_id': 'f647e284-38e13287a522943134d0a6f4',
        'msg_type': 'execute_input', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 25, 25, 796886, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': 'f647e284-38e13287a522943134d0a6f4', 'msg_type':
        'execute_input', 'parent_header': {'msg_id':
        '98026e92-79cb3634ae3be2e314a81649', 'msg_type': 'execute_request',
        'username': 'mgubi', 'session': 'c3870339-7d48ea325f778b60fba909c3',
        'date': datetime.datetime(2019, 6, 17, 15, 25, 25, 795737,
        tzinfo=tzutc()), 'version': '5.3'}, 'metadata': {}, 'content':
        {'code': 'x = np.linspace(0, 2, 100)\\nplt.plot(x, x,
        label=\\'linear\\')\\nplt.plot(x, x**2,
        label=\\'quadratic\\')\\nplt.plot(x, x**3,
        label=\\'cubic\\')\\nplt.xlabel(\\'x label\\')\\nplt.ylabel(\\'y
        label\\')\\nplt.title("Simple Plot")\\nplt.legend()\\nplt.show()',
        'execution_count': 3}, 'buffers': []}

        {'header': {'msg_id': '4925b794-a3d63202a6302312804e93c5',
        'msg_type': 'stream', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 25, 25, 831581, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '4925b794-a3d63202a6302312804e93c5', 'msg_type': 'stream',
        'parent_header': {'msg_id': '98026e92-79cb3634ae3be2e314a81649',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 25, 25, 795737, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'name': 'stderr', 'text':
        "/usr/local/lib/python3.7/site-packages/ipykernel_launcher.py:9:
        UserWarning: Matplotlib is currently using ps, which is a non-GUI
        backend, so cannot show the figure.\\n \ if __name__ ==
        '__main__':\\n"}, 'buffers': []}

        /usr/local/lib/python3.7/site-packages/ipykernel_launcher.py:9:
        UserWarning: Matplotlib is currently using ps, which is a non-GUI
        backend, so cannot show the figure.

        \ \ if __name__ == '__main__':

        {'header': {'msg_id': 'cae52008-afae9cb50a4dcad2ed8bf964',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 25, 25, 836161, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': 'cae52008-afae9cb50a4dcad2ed8bf964', 'msg_type': 'status',
        'parent_header': {'msg_id': '98026e92-79cb3634ae3be2e314a81649',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 25, 25, 795737, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'idle'}, 'buffers':
        []}
      </errput>
    </unfolded-io>

    <\unfolded-io>
      In [4]:\ 
    <|unfolded-io>
      plt.show()
    <|unfolded-io>
      <\errput>
        {'header': {'msg_id': 'a6f20fa4-0355aff7852b0e6c2e3398f7',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 26, 26, 25110, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': 'a6f20fa4-0355aff7852b0e6c2e3398f7', 'msg_type': 'status',
        'parent_header': {'msg_id': '18708dd2-156a60545c4e4a558e41a94b',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 26, 26, 24188, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'busy'}, 'buffers':
        []}

        {'header': {'msg_id': '6dd7c1e9-f3851432473e78f0b78eb526',
        'msg_type': 'execute_input', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 26, 26, 25309, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '6dd7c1e9-f3851432473e78f0b78eb526', 'msg_type':
        'execute_input', 'parent_header': {'msg_id':
        '18708dd2-156a60545c4e4a558e41a94b', 'msg_type': 'execute_request',
        'username': 'mgubi', 'session': 'c3870339-7d48ea325f778b60fba909c3',
        'date': datetime.datetime(2019, 6, 17, 15, 26, 26, 24188,
        tzinfo=tzutc()), 'version': '5.3'}, 'metadata': {}, 'content':
        {'code': 'plt.show()', 'execution_count': 4}, 'buffers': []}

        {'header': {'msg_id': '3ccef453-df073af780174f259ea352fa',
        'msg_type': 'stream', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 26, 26, 26840, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '3ccef453-df073af780174f259ea352fa', 'msg_type': 'stream',
        'parent_header': {'msg_id': '18708dd2-156a60545c4e4a558e41a94b',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 26, 26, 24188, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'name': 'stderr', 'text':
        '/usr/local/lib/python3.7/site-packages/ipykernel_launcher.py:1:
        UserWarning: Matplotlib is currently using ps, which is a non-GUI
        backend, so cannot show the figure.\\n \ """Entry point for launching
        an IPython kernel.\\n'}, 'buffers': []}

        /usr/local/lib/python3.7/site-packages/ipykernel_launcher.py:1:
        UserWarning: Matplotlib is currently using ps, which is a non-GUI
        backend, so cannot show the figure.

        \ \ """Entry point for launching an IPython kernel.

        {'header': {'msg_id': '0f250775-c5c51a8d7482cc11cd02c3ae',
        'msg_type': 'status', 'username': 'mgubi', 'session':
        'cc1ef1e9-4e10253ded3f8e0d64748264', 'date': datetime.datetime(2019,
        6, 17, 15, 26, 26, 28512, tzinfo=tzutc()), 'version': '5.3'},
        'msg_id': '0f250775-c5c51a8d7482cc11cd02c3ae', 'msg_type': 'status',
        'parent_header': {'msg_id': '18708dd2-156a60545c4e4a558e41a94b',
        'msg_type': 'execute_request', 'username': 'mgubi', 'session':
        'c3870339-7d48ea325f778b60fba909c3', 'date': datetime.datetime(2019,
        6, 17, 15, 26, 26, 24188, tzinfo=tzutc()), 'version': '5.3'},
        'metadata': {}, 'content': {'execution_state': 'idle'}, 'buffers':
        []}
      </errput>
    </unfolded-io>

    <\unfolded-io>
      In [8]:\ 
    <|unfolded-io>
      x = np.arange(0, 10, 0.2)

      y = np.sin(x)

      fig, ax = plt.subplots()

      ax.plot(x, y)

      plt.show()
    <|unfolded-io>
      \<less\>Figure size 432x288 with 1 Axes\<gtr\>
    </unfolded-io>

    <\unfolded-io>
      In [3]:\ 
    <|unfolded-io>
      _2
    <|unfolded-io>
      <\errput>
        [0;31m---------------------------------------------------------------------------[0m[0;31mNameError[0m
        \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Traceback
        (most recent call last)[0;32m\<less\>ipython-input-3-725b9f20c2d7\<gtr\>[0m
        in [0;36m\<less\>module\<gtr\>[0;34m[0m

        [0;32m----\<gtr\> 1[0;31m [0m_2[0m[0;34m[0m[0;34m[0m[0m

        [0m[0;31mNameError[0m: name '_2' is not defined
      </errput>
    </unfolded-io>

    <\unfolded-io>
      In [4]:\ 
    <|unfolded-io>
      _
    <|unfolded-io>
      Out[4]: ''
    </unfolded-io>

    <\unfolded-io>
      In [5]:\ 
    <|unfolded-io>
      ___
    <|unfolded-io>
      Out[5]: ''
    </unfolded-io>

    <\unfolded-io>
      In [6]:\ 
    <|unfolded-io>
      _i2
    <|unfolded-io>
      Out[6]: "fig = plt.figure() \ # an empty figure with no
      axes\\nfig.suptitle('No axes on this figure') \ # Add a title so we
      know which it is\\nfig, ax_lst = plt.subplots(2, 2) \ # a figure with a
      2x2 grid of Axes"
    </unfolded-io>

    <\unfolded-io>
      In [7]:\ 
    <|unfolded-io>
      _2
    <|unfolded-io>
      <\errput>
        [0;31m---------------------------------------------------------------------------[0m[0;31mNameError[0m
        \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Traceback
        (most recent call last)[0;32m\<less\>ipython-input-7-725b9f20c2d7\<gtr\>[0m
        in [0;36m\<less\>module\<gtr\>[0;34m[0m

        [0;32m----\<gtr\> 1[0;31m [0m_2[0m[0;34m[0m[0;34m[0m[0m

        [0m[0;31mNameError[0m: name '_2' is not defined
      </errput>
    </unfolded-io>

    <\input>
      In [8]:\ 
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|font|pagella>
    <associate|font-family|rm>
    <associate|math-font|math-pagella>
  </collection>
</initial>