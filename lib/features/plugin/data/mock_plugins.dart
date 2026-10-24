import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_pricing.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_urls.dart';
import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';

const _jetbrains = VendorModel(
  id: 1,
  name: 'JetBrains s.r.o.',
  url: 'https://www.jetbrains.com/',
  country: 'Czech Republic',
  isVerified: true,
);

const _atomMaterialThemesPlugins = VendorModel(
  id: 279,
  name: 'Atom Material Themes & Plugins',
  url: 'https://www.material-theme.com',
  country: 'Israel',
  isVerified: true,
);

const _catppuccin = VendorModel(
  id: 698,
  name: 'Catppuccin',
  url: 'https://catppuccin.com',
  country: 'United Kingdom',
  isVerified: false,
);

const _gerryThemes = VendorModel(
  id: 661,
  name: 'Gerry Themes',
  url: 'http://github.com/gerry-themes',
  country: 'China Mainland',
  isVerified: true,
);

const _zhihaoZhang = VendorModel(
  id: 725,
  name: 'Zhihao Zhang',
  url: 'https://izhangzhihao.github.io',
  country: 'United States',
  isVerified: true,
);

const _martinSommer = VendorModel(
  id: 2035,
  name: 'Martin Sommer',
  url: 'https://www.GitHub.com/SeeSharpSoft',
  country: 'Canada',
  isVerified: false,
);

const _markSkelton = VendorModel(
  id: 3815,
  name: 'Mark Skelton',
  url: 'https://mskelton.dev',
  country: 'United States',
  isVerified: false,
);

const _yiiGuxing = VendorModel(
  id: 2634,
  name: 'Yii.Guxing',
  url: 'https://github.com/YiiGuxing',
  country: 'China Mainland',
  isVerified: false,
);

const _lukaszZielinski = VendorModel(
  id: 753,
  name: 'Łukasz Zieliński',
  url: 'https://www.lukasz-zielinski.com',
  country: 'Poland',
  isVerified: true,
);

const _halCorner = VendorModel(
  id: 28,
  name: 'Hal\'s Corner',
  url: 'https://halirutan.de/',
  country: 'Germany',
  isVerified: true,
);

const _zihanMa = VendorModel(
  id: 3439,
  name: 'Zihan Ma',
  url: 'https://github.com/WhiteVermouth',
  country: 'Hong Kong',
  isVerified: false,
);

const _andreyKolchanov = VendorModel(
  id: 4391,
  name: 'Andrey Kolchanov',
  url: 'https://github.com/andrey4623',
  country: null,
  isVerified: false,
);

const _tylerThrailkill = VendorModel(
  id: 3953,
  name: 'Tyler Thrailkill',
  url: 'http://tylerthrailkill.com',
  country: 'United States',
  isVerified: false,
);

const _sealWu = VendorModel(
  id: 2457,
  name: 'seal wu',
  url: 'https://www.github.com/wuseal',
  country: 'United Arab Emirates',
  isVerified: false,
);

const _antelle = VendorModel(
  id: 4581,
  name: 'Antelle',
  url: 'https://antelle.net',
  country: null,
  isVerified: false,
);

const _vladimirSchneider = VendorModel(
  id: 8,
  name: 'Vladimir Schneider',
  url: 'https://github.com/vsch',
  country: 'Canada',
  isVerified: true,
);

const _vojtechKrasa = VendorModel(
  id: 2268,
  name: 'Vojtěch Krása',
  url: '',
  country: null,
  isVerified: false,
);

const List<VendorModel> mockVendors = [
  _jetbrains,
  _atomMaterialThemesPlugins,
  _catppuccin,
  _gerryThemes,
  _zhihaoZhang,
  _martinSommer,
  _markSkelton,
  _yiiGuxing,
  _lukaszZielinski,
  _halCorner,
  _zihanMa,
  _andreyKolchanov,
  _tylerThrailkill,
  _sealWu,
  _antelle,
  _vladimirSchneider,
  _vojtechKrasa,
];

const List<PluginModel> mockPlugins = [
  PluginModel(
    id: 6954,
    xmlId: 'org.jetbrains.kotlin',
    name: 'Kotlin',
    preview: 'Provides language support for Kotlin, a modern programming language designed to make developers happier. Getting Started Public Slack Issue tracker.',
    downloads: 37791239,
    rating: 4.16,
    pricing: PluginPricing.free,
    tags: ['Programming Language'],
    vendor: _jetbrains,
    urls: PluginUrls(
      docUrl: 'https://kotlinlang.org/docs/home.html',
      sourceCodeUrl: 'https://github.com/JetBrains/intellij-community/tree/master/plugins/kotlin',
      bugtrackerUrl: 'https://youtrack.jetbrains.com/issues/KTIJ',
      forumUrl: 'https://discuss.kotlinlang.org/',
    ),
  ),
  PluginModel(
    id: 164,
    xmlId: 'IdeaVIM',
    name: 'IdeaVim',
    preview: 'Bring the power of Vim to your JetBrains IDE. IdeaVim is a Vim emulation plugin that lets you edit code using Vim\'s modal editing, motions, text objects, and commands...',
    downloads: 22119551,
    rating: 4.44,
    pricing: PluginPricing.free,
    tags: ['Editor'],
    vendor: _jetbrains,
    urls: PluginUrls(
      sourceCodeUrl: 'https://github.com/JetBrains/ideavim',
      bugtrackerUrl: 'http://youtrack.jetbrains.net/issues/VIM',
    ),
  ),
  PluginModel(
    id: 14936,
    xmlId: 'com.jetbrains.kmm',
    name: 'Kotlin Multiplatform',
    preview: 'This plugin for IntelliJ IDEA and Android Studio enables you to develop Kotlin Multiplatform applications targeting Android, iOS, desktop, web, and server. Write...',
    downloads: 2111468,
    rating: 3.96,
    pricing: PluginPricing.free,
    tags: ['Android', 'Programming Language', 'iOS'],
    vendor: _jetbrains,
    urls: PluginUrls(
      docUrl: 'https://www.jetbrains.com/help/kotlin-multiplatform-dev/quickstart.html',
      bugtrackerUrl: 'https://youtrack.jetbrains.com/issues/KMT',
    ),
  ),
  PluginModel(
    id: 16340,
    xmlId: 'org.jetbrains.plugins.kotlin.jupyter',
    name: 'Kotlin Notebook',
    preview: 'Please note: Starting with v2026.2, JetBrains will sunset Kotlin Notebook as a product and will no longer maintain it. Kotlin Notebook will be unbundled from IntelliJ...',
    downloads: 3753267,
    rating: 3.9,
    pricing: PluginPricing.free,
    tags: ['Data Science'],
    vendor: _jetbrains,
    urls: PluginUrls(
      docUrl: 'https://github.com/Kotlin/kotlin-jupyter/tree/master/docs',
      bugtrackerUrl: 'https://youtrack.jetbrains.com/issues/KTNB',
    ),
  ),
  PluginModel(
    id: 13121,
    xmlId: 'com.jetbrains.restClient',
    name: 'HTTP Client',
    preview: 'Provides the ability to compose and execute HTTP requests from the code editor. The following features are available: Coding assistance with completion, highlighting...',
    downloads: 15505515,
    rating: 3.75,
    pricing: PluginPricing.free,
    tags: ['Web'],
    vendor: _jetbrains,
    urls: PluginUrls(
      docUrl: 'https://www.jetbrains.com/help/idea/http-client-in-product-code-editor.html',
      bugtrackerUrl: 'https://youtrack.jetbrains.com/newIssue?project=IJPL&c=Subsystem+Tools.+HTTP+Client',
    ),
  ),
  PluginModel(
    id: 7793,
    xmlId: 'org.intellij.plugins.markdown',
    name: 'Markdown',
    preview: 'Provides editing assistance for Markdown files within the IDE. Full support for vanilla Markdown syntax: highlighting, completion, navigation, inspection, intentions...',
    downloads: 14571920,
    rating: 2.59,
    pricing: PluginPricing.free,
    tags: ['Programming Language'],
    vendor: _jetbrains,
    urls: PluginUrls(
      docUrl: 'https://www.jetbrains.com/help/idea/markdown.html',
      sourceCodeUrl: 'https://github.com/JetBrains/intellij-community/tree/master/plugins/markdown',
      bugtrackerUrl: 'https://youtrack.jetbrains.com/issues/IDEA?q=Subsystem:%20%7BLang.%20Markdown%7D%20',
    ),
  ),
  PluginModel(
    id: 10485,
    xmlId: 'com.intellij.kubernetes',
    name: 'Kubernetes',
    preview: 'Provides advanced editor and runtime support for Kubernetes. Features: Cluster interaction Browsing cluster objects, extracting and editing their configurations...',
    downloads: 17754946,
    rating: 3.77,
    pricing: PluginPricing.free,
    tags: ['Cloud'],
    vendor: _jetbrains,
    urls: PluginUrls(
      docUrl: 'https://www.jetbrains.com/help/idea/kubernetes.html',
      bugtrackerUrl: 'https://youtrack.jetbrains.com/issues/IJPL?q=Subsystem:%20%7BTools.%20Kubernetes%7D',
    ),
  ),
  PluginModel(
    id: 13115,
    xmlId: 'org.jetbrains.plugins.github',
    name: 'GitHub',
    preview: 'Provides integration with GitHub. Specify your GitHub account to access all of your repositories from the IDE. Clone repositories, create and review pull requests...',
    downloads: 27802115,
    rating: 3.66,
    pricing: PluginPricing.free,
    tags: ['VCS'],
    vendor: _jetbrains,
    urls: PluginUrls(
      sourceCodeUrl: 'https://github.com/JetBrains/intellij-community/tree/master/plugins/github',
      bugtrackerUrl: 'https://youtrack.jetbrains.com/issues/IJPL?q=%23%7BVersion%20Control.%20GitHub%7D%20',
    ),
  ),
  PluginModel(
    id: 8006,
    xmlId: 'com.chrisrm.idea.MaterialThemeUI',
    name: 'Material Theme UI',
    preview: 'Material Theme UI Plugin Material Design Experience for JetBrains IDEs Material Theme UI is a plugin for JetBrains IDE (IntelliJ IDEA, WebStorm, Android Studio and so...',
    downloads: 18795175,
    rating: 3.96,
    pricing: PluginPricing.freemium,
    tags: ['User Interface'],
    vendor: _atomMaterialThemesPlugins,
    urls: PluginUrls(
      docUrl: 'https://www.material-theme.com',
      sourceCodeUrl: 'https://github.com/mallowigi/material-theme-issues',
      bugtrackerUrl:
          'https://github.com/mallowigi/material-theme-issues/issues',
      forumUrl: 'https://github.com/mallowigi/material-theme-issues/issues',
    ),
  ),
  PluginModel(
    id: 10044,
    xmlId: 'com.mallowigi',
    name: 'Atom Material Icons',
    preview: 'Atom Material File Icons Custom File and IDE Icons for improved visual grepping This plugin is a port of the Atom File Icons and the icons of the Material Theme UI...',
    downloads: 10116309,
    rating: null,
    pricing: PluginPricing.free,
    tags: ['User Interface'],
    vendor: _atomMaterialThemesPlugins,
    urls: PluginUrls(
      docUrl: 'https://github.com/AtomMaterialUI/a-file-icon-idea',
      sourceCodeUrl: 'https://github.com/mallowigi/a-file-icon-idea',
      bugtrackerUrl: 'https://github.com/AtomMaterialUI/a-file-icon-idea',
      forumUrl: 'https://github.com/AtomMaterialUI/a-file-icon-idea',
    ),
  ),
  PluginModel(
    id: 13309,
    xmlId: 'com.mallowigi.colorHighlighter',
    name: 'Color Highlighter',
    preview: 'Color Highlighter Highlight Colors in your IDE This plugin highlights colors in editors in order to make them stand out in your code. This does the same as "Show CSS...',
    downloads: 262238,
    rating: null,
    pricing: PluginPricing.free,
    tags: ['Editor'],
    vendor: _atomMaterialThemesPlugins,
    urls: PluginUrls(
      sourceCodeUrl: 'https://github.com/mallowigi/color-highlighter',
      bugtrackerUrl: 'https://github.com/mallowigi/color-highlighter/issues',
      forumUrl: 'https://github.com/mallowigi/color-highlighter',
    ),
  ),
  PluginModel(
    id: 18682,
    xmlId: 'com.github.catppuccin.jetbrains',
    name: 'Catppuccin Theme',
    preview: 'Soothing pastel theme for JetBrains IDEs Catppuccin is a community-driven pastel theme that aims to be the middle ground between low and high contrast themes. It...',
    downloads: 2152609,
    rating: 4.81,
    pricing: PluginPricing.free,
    tags: ['Editor', 'Editor Color Schemes', 'User Interface'],
    vendor: _catppuccin,
    urls: PluginUrls(
      docUrl: 'https://github.com/catppuccin/catppuccin',
      sourceCodeUrl: 'https://github.com/catppuccin/jetbrains',
      bugtrackerUrl: 'https://github.com/catppuccin/jetbrains/issues',
    ),
  ),
  PluginModel(
    id: 23029,
    xmlId: 'com.github.catppuccin.jetbrains_icons',
    name: 'Catppuccin Icons',
    preview: 'Soothing pastel icons for JetBrains IDEs This is an icon pack designed to be used with the Catppuccin Theme extension. Usage Head to Settings -> Appearance &...',
    downloads: 579769,
    rating: null,
    pricing: PluginPricing.free,
    tags: ['Editor Color Schemes', 'User Interface'],
    vendor: _catppuccin,
    urls: PluginUrls(
      sourceCodeUrl: 'https://github.com/catppuccin/jetbrains-icons',
    ),
  ),
  PluginModel(
    id: 18922,
    xmlId: 'com.jetbrains.gerryPurpleTheme',
    name: 'Gerry Themes',
    preview: 'Gerry Themes is a refined themes collection for IntelliJ-based IDEs, designed for a comfortable development experience.Basic features in Gerry Themes & Gerry...',
    downloads: 3738553,
    rating: 4.94,
    pricing: PluginPricing.free,
    tags: ['Code Editing', 'Editor', 'Editor Color Schemes', 'Fun Stuff'],
    vendor: _gerryThemes,
    urls: PluginUrls(
      docUrl: 'https://plugins.jetbrains.com/plugin/18922-gerry-themes/about',
      sourceCodeUrl: 'https://github.com/gerry-themes/gerry-themes',
      bugtrackerUrl: 'https://github.com/gerry-themes/gerry-themes/issues',
      forumUrl: 'https://github.com/gerry-themes/gerry-themes',
    ),
  ),
  PluginModel(
    id: 19668,
    xmlId: 'com.jetbrains.gerryThemesPro',
    name: 'Gerry Themes Pro',
    preview: 'Gerry Themes Pro is a refined themes collection for IntelliJ-based IDEs, designed for a comfortable development experience.Basic features in Gerry Themes & Gerry...',
    downloads: 546283,
    rating: 4.95,
    pricing: PluginPricing.paid,
    tags: ['Code Editing', 'Editor', 'Editor Color Schemes', 'Fun Stuff'],
    vendor: _gerryThemes,
    urls: PluginUrls(
      docUrl:
          'https://plugins.jetbrains.com/plugin/19668-gerry-themes-pro/about',
      sourceCodeUrl: 'https://github.com/gerry-themes/gerry-themes',
      bugtrackerUrl: 'https://github.com/gerry-themes/gerry-themes/issues',
      forumUrl: 'https://github.com/gerry-themes/gerry-themes',
    ),
  ),
  PluginModel(
    id: 10080,
    xmlId: 'izhangzhihao.rainbow.brackets',
    name: 'Rainbow Brackets',
    preview: 'Rainbow Brackets for IntelliJ based IDEs/Android Studio/HUAWEI DevEco Studio Core Features Rainbowify various types brackets(Round,Squiggly,Square,Angle) Rainbowify...',
    downloads: 24937027,
    rating: 4.58,
    pricing: PluginPricing.freemium,
    tags: ['Code Editing', 'Code Tools', 'Editor', 'Fun Stuff'],
    vendor: _zhihaoZhang,
    urls: PluginUrls(
      docUrl:
          'https://github.com/izhangzhihao/intellij-rainbow-brackets#install',
      sourceCodeUrl:
          'https://github.com/izhangzhihao/intellij-rainbow-brackets',
      bugtrackerUrl:
          'https://github.com/izhangzhihao/intellij-rainbow-brackets/issues',
      forumUrl:
          'https://github.com/izhangzhihao/intellij-rainbow-brackets/issues',
    ),
  ),
  PluginModel(
    id: 10037,
    xmlId: 'net.seesharpsoft.intellij.plugins.csv',
    name: 'CSV Editor',
    preview: 'Plugin for editing CSV files with a rainbow colored table- & text-editor. It provides syntax-validation, highlighting, customization, and plenty more besides...',
    downloads: 13448700,
    rating: 4.54,
    pricing: PluginPricing.free,
    tags: ['Programming Language'],
    vendor: _martinSommer,
    urls: PluginUrls(
      docUrl: 'https://github.com/SeeSharpSoft/intellij-csv-validator/blob/master/README.md',
      sourceCodeUrl: 'https://github.com/SeeSharpSoft/intellij-csv-validator',
      bugtrackerUrl:
          'https://github.com/SeeSharpSoft/intellij-csv-validator/issues',
    ),
  ),
  PluginModel(
    id: 11938,
    xmlId: 'com.markskelton.one-dark-theme',
    name: 'One Dark Theme',
    preview: 'One Dark theme for JetBrains. After installing the theme, go to Preferences | Appearance & Behavior | Appearance and select the One Dark theme (or Islands variant...',
    downloads: 11714700,
    rating: 4.84,
    pricing: PluginPricing.free,
    tags: ['User Interface'],
    vendor: _markSkelton,
    urls: PluginUrls(
      docUrl: 'https://github.com/one-dark/jetbrains-one-dark-theme#readme',
      sourceCodeUrl: 'https://github.com/one-dark/jetbrains-one-dark-theme',
      bugtrackerUrl:
          'https://github.com/one-dark/jetbrains-one-dark-theme/issues',
    ),
  ),
  PluginModel(
    id: 8579,
    xmlId: 'cn.yiiguxing.plugin.translate',
    name: 'Translation',
    preview: 'Translation plugin for IntelliJ-based IDEs. Website | GitHub | Get Started | Donate Features Multiple translation engines. Microsoft Translator. Google Translate...',
    downloads: 10736635,
    rating: 4.89,
    pricing: PluginPricing.free,
    tags: ['Code Tools', 'Tools Integration'],
    vendor: _yiiGuxing,
    urls: PluginUrls(
      docUrl: 'https://yiiguxing.github.io/TranslationPlugin/#/en/docs',
      sourceCodeUrl: 'https://github.com/YiiGuxing/TranslationPlugin',
      bugtrackerUrl: 'https://github.com/YiiGuxing/TranslationPlugin/issues',
    ),
  ),
  PluginModel(
    id: 7499,
    xmlId: 'zielu.gittoolbox',
    name: 'GitToolBox',
    preview: 'Extends Git Integration with additional features Free features number of ahead, behind commits in project view and status bar number of not commited changes in project...',
    downloads: 10502262,
    rating: 4.64,
    pricing: PluginPricing.freemium,
    tags: ['Productivity', 'VCS'],
    vendor: _lukaszZielinski,
    urls: PluginUrls(
      docUrl: 'https://www.gittoolbox.com/',
      bugtrackerUrl: 'https://github.com/zielu/GitToolBox/issues',
    ),
  ),
  PluginModel(
    id: 9792,
    xmlId: 'Key Promoter X',
    name: 'Key Promoter X',
    preview: 'The Key Promoter X helps you to learn essential shortcuts while you work. When you use the mouse on a button inside the IDE, the Key Promoter X shows you the keyboard...',
    downloads: 8204302,
    rating: 4.94,
    pricing: PluginPricing.free,
    tags: ['Notification and Visualizers', 'Productivity'],
    vendor: _halCorner,
    urls: PluginUrls(
      docUrl: 'https://github.com/halirutan/IntelliJ-Key-Promoter-X/blob/master/README.md',
      sourceCodeUrl: 'https://github.com/halirutan/IntelliJ-Key-Promoter-X',
      bugtrackerUrl:
          'https://github.com/halirutan/IntelliJ-Key-Promoter-X/issues',
      forumUrl: 'https://jetbrains-platform.slack.com/archives/C01R5HSU9R6',
    ),
  ),
  PluginModel(
    id: 12275,
    xmlId: 'com.vermouthx.idea',
    name: 'Dracula Theme',
    preview: 'Dracula Theme for JetBrains Install All instructions can be found at draculatheme.com/jetbrains. Dracula PRO Dracula PRO is a color scheme and UI theme tailored for...',
    downloads: 3578082,
    rating: 4.42,
    pricing: PluginPricing.free,
    tags: ['Editor Color Schemes', 'User Interface'],
    vendor: _zihanMa,
    urls: PluginUrls(
      docUrl: 'https://draculatheme.com/jetbrains',
      sourceCodeUrl: 'https://github.com/dracula/jetbrains',
      bugtrackerUrl: 'https://github.com/dracula/jetbrains/issues',
    ),
  ),
  PluginModel(
    id: 12896,
    xmlId: 'com.andrey4623.rainbowcsv',
    name: 'Rainbow CSV',
    preview: 'Plugin for highlighting CSV files in different colors. Features: Supports comma, semicolon, pipe, tab and colon as a delimiter; Supports double quote and backslash as...',
    downloads: 1830974,
    rating: 4.08,
    pricing: PluginPricing.free,
    tags: ['Editor'],
    vendor: _andreyKolchanov,
    urls: PluginUrls(
      sourceCodeUrl: 'https://github.com/andrey4623/intellij-rainbow-csv',
      bugtrackerUrl:
          'https://github.com/andrey4623/intellij-rainbow-csv/issues',
    ),
  ),
  PluginModel(
    id: 12112,
    xmlId: 'com.tylerthrailkill.intellij.solarized',
    name: 'Solarized Theme',
    preview: 'Adds Solarized Dark and Light themes https://ethanschoonover.com/solarized/.',
    downloads: 2457681,
    rating: 4.39,
    pricing: PluginPricing.free,
    tags: ['Editor Color Schemes'],
    vendor: _tylerThrailkill,
    urls: PluginUrls(
      docUrl: 'https://github.com/snowe2010/solarized-jetbrains',
      sourceCodeUrl: 'https://github.com/snowe2010/solarized-jetbrains',
      bugtrackerUrl: 'https://github.com/snowe2010/solarized-jetbrains/issues',
      forumUrl: 'https://github.com/snowe2010/solarized-jetbrains/issues',
    ),
  ),
  PluginModel(
    id: 9960,
    xmlId: 'wu.seal.tool.jsontokotlin',
    name: 'JSON To Kotlin Class (JsonToKotlinClass)',
    preview: 'Plugin for Kotlin to convert Json String into Kotlin data class code quickly Fast use it with short cut key ALT + K on Windows or Option + K on Mac Features...',
    downloads: 1188511,
    rating: 4.8,
    pricing: PluginPricing.free,
    tags: ['Code Tools'],
    vendor: _sealWu,
    urls: PluginUrls(
      docUrl: 'http://blog.csdn.net/wuseal/article/details/77508585',
      sourceCodeUrl: 'https://github.com/wuseal/JsonToKotlinClass',
      bugtrackerUrl: 'https://github.com/wuseal/JsonToKotlinClass/issues',
      forumUrl: 'https://github.com/wuseal/JsonToKotlinClass',
    ),
  ),
  PluginModel(
    id: 13106,
    xmlId: 'net.antelle.intellij-xcode-dark-theme',
    name: 'Xcode-Dark Theme',
    preview: 'This theme brings colors from the Xcode Dark theme to IntelliJ. To install: Go to Settings (Preferences) | Plugins, find the theme plugin, and install it Restart the...',
    downloads: 1175051,
    rating: 4.9,
    pricing: PluginPricing.free,
    tags: ['User Interface'],
    vendor: _antelle,
    urls: PluginUrls(
      sourceCodeUrl: 'https://github.com/antelle/intellij-xcode-dark-theme',
      bugtrackerUrl:
          'https://github.com/antelle/intellij-xcode-dark-theme/issues',
    ),
  ),
  PluginModel(
    id: 7896,
    xmlId: 'com.vladsch.idea.multimarkdown',
    name: 'Markdown Navigator Enhanced',
    preview: 'Document with pleasure! Work with Markdown files like you do with other languages in the IDE, by getting full support for: Paste images into documents for fast screen...',
    downloads: 5392064,
    rating: 3.68,
    pricing: PluginPricing.free,
    tags: ['Programming Language'],
    vendor: _vladimirSchneider,
    urls: PluginUrls(
      docUrl: 'https://github.com/vsch/idea-multimarkdown/wiki',
      sourceCodeUrl: 'https://github.com/vsch/idea-multimarkdown',
      bugtrackerUrl: 'https://github.com/vsch/idea-multimarkdown/issues',
    ),
  ),
  PluginModel(
    id: 6546,
    xmlId: 'EclipseCodeFormatter',
    name: 'Adapter for Eclipse Code Formatter',
    preview: 'Allows using Eclipse\'s Java code formatter directly from IntelliJ. Solves the problem of maintaining a common code style in team environments where both IDEA and...',
    downloads: 1752639,
    rating: 4.9,
    pricing: PluginPricing.free,
    tags: ['Formatting'],
    vendor: _vojtechKrasa,
    urls: PluginUrls(
      docUrl: 'https://github.com/krasa/EclipseCodeFormatter#instructions',
      sourceCodeUrl: 'https://github.com/krasa/EclipseCodeFormatter',
      bugtrackerUrl: 'https://github.com/krasa/EclipseCodeFormatter/issues',
    ),
  ),
];
