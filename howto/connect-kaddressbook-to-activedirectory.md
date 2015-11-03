---
layout: page
title: Howto | Connect KAddressBook to ActiveDirectory
menu: howto
weight: 40
---

## Connect KAddressBook to ActiveDirectory

In Kmail, under Contacts, in the lower half of the screen press button to [Add]. Select LDAP.

| Name           | Value                                               |
|----------------+-----------------------------------------------------|
| Name           | Enter the resource name here                        |
| Read only      | [x]                                                 |
| User           | ADDOMAIN\~username~                                 |
| Bind DN        | ADDOMAIN                                            |
| Realm          |                                                     |
| Password       | ~userpass~                                          |
| Host           | hostname.domain.co.uk                               |
| Port           | 3268 (this is the port used by ActiveDirectory)     |
| LDAP           | 3                                                   |
| Size limit     | default                                             |
| Time limit     | default                                             |
| DN             | OU=Exact ActiveDirectory Name,DC=domain,DC=co,DC=uk |
| Security       | NO                                                  |
| Authentication | Simple                                              |
| Subtree query  | [x]                                                 |
| Offline use    | Use local copy if no connection                     |

 