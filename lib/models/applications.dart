part of 'package:crackit/app.dart';

class Applications {
  String? icon;
  String? name;
  String? url;
  List<Menu>? menu;

  Applications({this.icon, this.name, this.url, this.menu});

  Applications.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
    url = json['url'];
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['name'] = name;
    data['url'] = url;
    if (menu != null) {
      data['menu'] = menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  String? name;
  String? icon;
  List<String>? submenus;

  Menu({this.name, this.icon, this.submenus});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    submenus = json['submenus'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['submenus'] = submenus;
    return data;
  }
}

var map = [
  {
    "icon": "admin_panel_settings",
    "name": "IAM & ADMIN",
    "url": "/iam",
    "menu": [
      {"name": "Dashboard", "icon": "dashboard", "submenus": []},
      {
        "name": "Item1",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item2", "icon": "dashboard", "submenus": []},
      {
        "name": "Item3",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item4", "icon": "dashboard", "submenus": []},
      {
        "name": "Item5",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      }
    ]
  },
  {
    "icon": "hd_rounded",
    "name": "HRMS",
    "url": "/hrms",
    "menu": [
      {"name": "Dashboard", "icon": "dashboard", "submenus": []},
      {
        "name": "Item1",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item2", "icon": "dashboard", "submenus": []},
      {
        "name": "Item3",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item4", "icon": "dashboard", "submenus": []},
      {
        "name": "Item5",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      }
    ]
  },
  {
    "icon": "password",
    "name": "AUTH",
    "url": "/auth",
    "menu": [
      {"name": "Dashboard", "icon": "dashboard", "submenus": []},
      {
        "name": "Item1",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item2", "icon": "dashboard", "submenus": []},
      {
        "name": "Item3",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item4", "icon": "dashboard", "submenus": []},
      {
        "name": "Item5",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      }
    ]
  },
  {
    "icon": "account_circle",
    "name": "PROFILE",
    "url": "/profile",
    "menu": [
      {"name": "Dashboard", "icon": "dashboard", "submenus": []},
      {
        "name": "Item1",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item2", "icon": "dashboard", "submenus": []},
      {
        "name": "Item3",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item4", "icon": "dashboard", "submenus": []},
      {
        "name": "Item5",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      }
    ]
  },
  {
    "icon": "leave_bags_at_home",
    "name": "LEAVE MANAGEMENT",
    "url": "/leave",
    "menu": [
      {"name": "Dashboard", "icon": "dashboard", "submenus": []},
      {
        "name": "Item1",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item2", "icon": "dashboard", "submenus": []},
      {
        "name": "Item3",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item4", "icon": "dashboard", "submenus": []},
      {
        "name": "Item5",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      }
    ]
  },
  {
    "icon": "event_available",
    "name": "EMPLOYMENT STATUS",
    "url": "/employment",
    "menu": [
      {"name": "Dashboard", "icon": "dashboard", "submenus": []},
      {
        "name": "Item1",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item2", "icon": "dashboard", "submenus": []},
      {
        "name": "Item3",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item4", "icon": "dashboard", "submenus": []},
      {
        "name": "Item5",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      }
    ]
  },
  {
    "icon": "settings_accessibility_outlined",
    "name": "SETUP",
    "url": "/setup",
    "menu": [
      {"name": "Dashboard", "icon": "dashboard", "submenus": []},
      {
        "name": "Item1",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item2", "icon": "dashboard", "submenus": []},
      {
        "name": "Item3",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item4", "icon": "dashboard", "submenus": []},
      {
        "name": "Item5",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      }
    ]
  },
  {
    "icon": "join_full",
    "name": "JOBS",
    "url": "/jobs",
    "menu": [
      {"name": "Dashboard", "icon": "dashboard", "submenus": []},
      {
        "name": "Item1",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item2", "icon": "dashboard", "submenus": []},
      {
        "name": "Item3",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item4", "icon": "dashboard", "submenus": []},
      {
        "name": "Item5",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      }
    ]
  },
  {
    "icon": "train",
    "name": "TRAINING",
    "url": "/training",
    "menu": [
      {"name": "Dashboard", "icon": "dashboard", "submenus": []},
      {
        "name": "Item1",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item2", "icon": "dashboard", "submenus": []},
      {
        "name": "Item3",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      },
      {"name": "Item4", "icon": "dashboard", "submenus": []},
      {
        "name": "Item5",
        "icon": "dashboard",
        "submenus": ["subItem1", "subItem2", "subItem3", "subItem4"]
      }
    ]
  }
];
