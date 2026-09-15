# 低代码开发框架xqkeji双重授权协议

## 1. 协议接受与适用范围
1.1 本协议是您（自然人、法人或其他组织，以下简称“用户”）与框架开发者（以下简称“授权方”）之间关于使用低代码开发框架xqkeji（以下简称“框架”）二进制包（包括但不限于.dll、.so等文件及配套文档，下同）的法律协议。  
1.2 您通过任何方式获取、安装、复制、运行或使用框架，即视为已完整阅读、理解并同意本协议全部条款。如您不同意，应立即停止使用并删除框架所有副本。  
1.3 本协议未明确授权的权利，均由授权方保留。

## 2. 定义
2.1 “框架”：指授权方开发的低代码开发框架xqkeji的二进制形式、相关配置文件、说明文档及后续更新版本。  
2.2 “用户代码”：指用户基于框架开发的应用程序、组件、模块、接口等独立作品，不包含框架本身的代码或二进制文件。  
2.3 “开源许可”：指由开放源代码促进会（Open Source Initiative，简称OSI）官方认证通过的开源许可证（OSI-approved license），包括但不限于 GPL、LGPL、AGPL、MPL、MIT、BSD、Apache 等，具体以 OSI 官方公布的最新许可证清单为准。  
2.4 “商业许可”：指用户通过向授权方支付约定费用后，依据双方签署的《商业许可协议》获得的使用权限。  
2.5 “分发”：指以任何形式向第三方提供包含框架或基于框架开发的产品，包括但不限于销售、赠与、公开传播、嵌入其他产品中提供等。

## 3. 授权方式与义务
### 3.1 开源许可选项
3.1.1 若用户选择本选项，须将其用户代码以符合某一 OSI 认证开源许可证的条款公开发布（本协议与所选 OSI 许可证不一致的，以该 OSI 许可证为准），且该 OSI 许可证在用户代码分发时持续有效。  
3.1.2 用户代码在分发时必须：  
   （a）以符合某一 OSI 认证开源许可证的方式将完整源代码公开；  
   （b）提供完整、可编译的源代码（包括但不限于用户代码的全部模块、依赖关系及编译说明）；  
   （c）保留框架原有的版权声明、授权条款及免责声明，并在用户代码的显著位置注明“基于xqkeji框架开发”及本协议链接。  
3.1.3 用户不得通过修改、拆分框架或拆分用户代码等方式规避本开源选项的开源要求（例如将本应开源的用户代码以闭源方式分发）。

### 3.2 商业许可选项
3.2.1 若用户未选择第3.1条开源选项（即用户代码未以 OSI 认证开源许可证公开发布），则无论何种使用场景（包括但不限于闭源商业软件、SaaS/云服务、嵌入式产品、内部工具等），均必须事先与授权方签署《商业许可协议》并支付相应费用。  
3.2.2 商业许可的授权范围、使用期限、费用、限制及其他条款以双方另行签署的《商业许可协议》为准，该协议与本协议冲突的，以《商业许可协议》为准。  
3.2.3 未获得商业许可前，用户不得分发、部署或运行任何未依第3.1条开源的用户代码产品。

## 4. 知识产权
4.1 除本协议第4.4条所列第三方组件外，框架的全部知识产权（包括但不限于著作权、专利权、商标权、商业秘密等）归授权方独家所有。用户仅获得本协议明确授予的使用权，不得主张对框架的任何知识产权。  
4.2 用户代码的知识产权归用户所有，但用户代码的使用、分发等行为受本协议及所选授权方式的约束。  
4.3 用户不得移除或修改框架中任何关于知识产权的标识、声明或限制。

4.4 第三方组件与开源许可声明
框架在开发与编译过程中使用了以下第三方开源组件，其知识产权归各自原权利人所有，并受对应开源许可证约束，独立于本协议共存：  
（a）**Phalcon**（BSD 3-Clause "New"/"Revised"）：框架部分 Zephir 源代码参考并改编自 Phalcon 项目。依据 BSD 3-Clause，本框架分发时须保留其版权声明、许可条件与免责声明（详见随包附带的 NOTICES 文件）。  
（b）**Zephir**（MIT License）：框架以 Zephir 语言开发并编译，编译产物（.so/.dll）中嵌入了 Zephir 运行时的核心 C 代码。依据 MIT License，本框架分发时须保留其版权声明与许可声明（详见随包附带的 NOTICES 文件）。  
4.4.1 上述第三方组件的完整许可文本以随包分发的 NOTICES 文件为准；用户不得移除、修改或隐瞒该等声明。  
4.4.2 第三方组件的许可不影响本协议对授权方自有部分的双重授权约定；但若第三方组件对应的开源许可证与本协议存在冲突，以该第三方组件的对应开源许可证为准。

## 5. 限制与禁止条款
5.1 用户不得：  
   （a）对框架进行反向工程、反编译、反汇编或试图获取源代码（授权方书面许可的除外）；  
   （b）将框架用于违法活动（包括但不限于侵犯第三方权益、违反国家法律法规的行为）；  
   （c）以任何形式向第三方转让、出租、出借框架的使用权（商业许可另有约定的除外）；  
   （d）将框架作为独立产品销售，或声称框架由用户开发；  
   （e）修改框架的功能或代码后以原名称或类似名称分发。

## 6. 免责声明与责任限制
6.1 框架按“原样”提供，授权方不保证框架无缺陷、无漏洞或能持续运行，不对框架的适用性、安全性、准确性做任何明示或暗示的保证。  
6.2 因使用或无法使用框架导致的任何直接损失（如数据丢失、系统故障）或间接损失（如利润损失、业务中断），授权方不承担赔偿责任，除非该损失由授权方的故意或重大过失导致。  
6.3 用户应自行负责对框架的使用进行安全测试，并采取必要措施防范风险（如数据备份、权限控制等）。  
6.4 若用户将框架用于医疗、金融、航空等特殊领域，应自行确保符合相关行业法规，授权方不对该等领域的合规性承担责任。

## 7. 协议的变更与终止
7.1 授权方有权根据法律法规变化或业务需要修改本协议，修改后的协议将通过官网（https://xqkeji.cn/）公告或其他合理方式通知用户，通知发布后30日内未提出异议的，视为接受修改；如用户不同意，应立即停止使用框架。  
7.2 发生以下情形时，授权方有权终止本协议：  
   （a）用户违反本协议任何条款且在授权方通知后15日内未纠正；  
   （b）用户将框架用于违法活动；  
   （c）用户破产、清算或丧失履约能力。  
7.3 协议终止后，用户应立即停止使用框架并删除所有副本，已产生的义务（如开源承诺、赔偿责任）仍持续有效。

## 8. 争议解决与法律适用
8.1 因本协议引起的或与本协议有关的任何争议，双方应首先通过友好协商解决；协商不成的，任何一方均有权向授权方所在地有管辖权的人民法院提起诉讼。  
8.2 本协议的订立、效力、解释、履行及争议解决均适用中华人民共和国法律（不含冲突法规则）。

## 9. 其他
9.1 本协议构成双方就框架使用达成的完整协议，替代此前所有口头或书面约定。  
9.2 若本协议任何条款被认定为无效或不可执行，不影响其他条款的效力。  
9.3 授权方未行使或延迟行使本协议项下的权利，不视为放弃该权利。

---

# Low-Code Development Framework xqkeji Dual License Agreement

## 1. Acceptance and Scope of Agreement
1.1 This Agreement is a legal agreement between you (an individual, legal entity or other organization, hereinafter referred to as "User") and the developer of the Framework (hereinafter referred to as "Licensor") regarding the use of the binary package of the Low-Code Development Framework xqkeji (hereinafter referred to as "Framework"), including but not limited to .dll, .so files and supporting documents (the same below).  
1.2 By obtaining, installing, copying, running or using the Framework in any way, you are deemed to have fully read, understood and agreed to all terms of this Agreement. If you do not agree, you shall immediately cease use and delete all copies of the Framework.  
1.3 All rights not expressly granted in this Agreement are reserved by the Licensor.

## 2. Definitions
2.1 "Framework" means the binary form of the Low-Code Development Framework xqkeji developed by the Licensor, related configuration files, documentation and subsequent updated versions.  
2.2 "User Code" means independent works developed by the User based on the Framework, such as applications, components, modules, interfaces, excluding the code or binary files of the Framework itself.  
2.3 "Open Source License" means any license officially approved by the Open Source Initiative (OSI-approved license), including but not limited to GPL, LGPL, AGPL, MPL, MIT, BSD, Apache, subject to the latest license list published by OSI.  
2.4 "Commercial License" means the right to use obtained by the User after paying the agreed fee to the Licensor in accordance with the "Commercial License Agreement" signed by both parties.  
2.5 "Distribution" means providing products containing or developed based on the Framework to third parties in any form, including but not limited to sale, donation, public dissemination, embedding in other products, etc.

## 3. Licensing Methods and Obligations
### 3.1 Open Source License Option
3.1.1 If the User chooses this option, they must publicly release their User Code under the terms of an OSI-approved open source license (in case of inconsistency between this Agreement and the chosen OSI license, the OSI license shall prevail), and such OSI license shall remain valid at the time of distribution of the User Code.  
3.1.2 When distributing User Code, the User must:  
   (a) Publicly release the complete source code in a manner consistent with an OSI-approved open source license;  
   (b) Provide complete, compilable source code (including but not limited to all modules of User Code, dependencies and compilation instructions);  
   (c) Retain the original copyright notices, license terms and disclaimers of the Framework, and clearly indicate "Developed based on xqkeji Framework" and the link to this Agreement in a prominent position of the User Code.  
3.1.3 The User shall not evade the open-source requirements of this option by modifying, splitting the Framework or splitting the User Code (e.g., distributing User Code that should be open-sourced in closed source).

### 3.2 Commercial License Option
3.2.1 If the User does not choose the open-source option in Section 3.1 (i.e., the User Code is not publicly released under an OSI-approved open source license), regardless of the usage scenario (including but not limited to closed-source commercial software, SaaS/cloud services, embedded products, internal tools, etc.), they must sign a "Commercial License Agreement" with the Licensor in advance and pay the corresponding fees.  
3.2.2 The scope of authorization, term of use, fees, restrictions and other terms of the Commercial License shall be subject to the "Commercial License Agreement" separately signed by both parties. In case of conflict between such agreement and this Agreement, the "Commercial License Agreement" shall prevail.  
3.2.3 Without obtaining a Commercial License, the User shall not distribute, deploy or run any User Code product that is not open-sourced in accordance with Section 3.1.

## 4. Intellectual Property Rights
4.1 Except for the third-party components listed in Section 4.4 of this Agreement, all intellectual property rights of the Framework (including but not limited to copyright, patent rights, trademark rights, trade secrets, etc.) belong exclusively to the Licensor. The User only obtains the right to use as expressly granted in this Agreement and shall not claim any intellectual property rights to the Framework.  
4.2 The intellectual property rights of User Code belong to the User, but the use, distribution and other behaviors of User Code are subject to this Agreement and the selected licensing method.  
4.3 The User shall not remove or modify any identifiers, statements or restrictions related to intellectual property rights in the Framework.

4.4 Third-Party Components and Open Source License Notices
The Framework uses the following third-party open source components during its development and compilation. Their intellectual property rights belong to their respective original right holders and are subject to the corresponding open source licenses, coexisting independently of this Agreement:  
(a) **Phalcon** (BSD 3-Clause "New"/"Revised"): Part of the Framework's Zephir source code references and adapts code from the Phalcon project. Under BSD 3-Clause, the Framework must retain its copyright notice, license conditions and disclaimer when distributed (see the accompanying NOTICES file).  
(b) **Zephir** (MIT License): The Framework is developed and compiled in the Zephir language, and the compiled binary (.so/.dll) embeds Zephir's core runtime C code. Under the MIT License, the Framework must retain its copyright notice and license notice when distributed (see the accompanying NOTICES file).  
4.4.1 The complete license texts of the above third-party components shall be subject to the accompanying NOTICES file; the User shall not remove, modify or conceal such notices.  
4.4.2 The licenses of the third-party components do not affect this Agreement's dual-license arrangement for the Licensor's own portions; however, where a third-party component's open source license conflicts with this Agreement, the corresponding open source license of the third-party component shall prevail.

## 5. Restrictions and Prohibited Clauses
5.1 The User shall not:  
   (a) Reverse engineer, decompile, disassemble the Framework or attempt to obtain the source code (except with the written permission of the Licensor);  
   (b) Use the Framework for illegal activities (including but not limited to infringing third-party rights, violating national laws and regulations);  
   (c) Transfer, lease or lend the right to use the Framework to third parties in any form (unless otherwise agreed in the Commercial License);  
   (d) Sell the Framework as an independent product, or claim that the Framework is developed by the User;  
   (e) Distribute the modified functions or code of the Framework under the original name or similar names.

## 6. Disclaimer and Limitation of Liability
6.1 The Framework is provided "as is". The Licensor does not warrant that the Framework is free of defects, vulnerabilities or can run continuously, and makes no express or implied warranties regarding the suitability, security or accuracy of the Framework.  
6.2 The Licensor shall not be liable for any direct losses (such as data loss, system failure) or indirect losses (such as loss of profits, business interruption) caused by the use or inability to use the Framework, unless such losses are caused by the intentional or gross negligence of the Licensor.  
6.3 The User shall be responsible for conducting security tests on the use of the Framework and taking necessary measures to prevent risks (such as data backup, permission control, etc.).  
6.4 If the User uses the Framework in special fields such as medical care, finance, aviation, etc., they shall ensure compliance with relevant industry regulations, and the Licensor shall not be liable for compliance in such fields.

## 7. Modification and Termination of Agreement
7.1 The Licensor has the right to modify this Agreement in accordance with changes in laws and regulations or business needs. The modified Agreement will be notified to the User through announcements on the official website (https://xqkeji.cn/) or other reasonable means. Failure to object within 30 days after the notice is issued shall be deemed acceptance of the modification; if the User does not agree, they shall immediately stop using the Framework.  
7.2 The Licensor has the right to terminate this Agreement in the following circumstances:  
   (a) The User violates any term of this Agreement and fails to correct it within 15 days after being notified by the Licensor;  
   (b) The User uses the Framework for illegal activities;  
   (c) The User is bankrupt, liquidated or loses the ability to perform obligations.  
7.3 After the termination of the Agreement, the User shall immediately stop using the Framework and delete all copies, and the existing obligations (such as open-source commitments, liability for compensation) shall remain valid.

## 8. Dispute Resolution and Governing Law
8.1 Any dispute arising from or in connection with this Agreement shall first be resolved through friendly negotiation between the parties; if negotiation fails, either party shall have the right to file a lawsuit with the competent people's court at the Licensor's location.  
8.2 The formation, validity, interpretation, performance and dispute resolution of this Agreement shall be governed by the laws of the People's Republic of China (excluding conflict of law rules).

## 9. Miscellaneous
9.1 This Agreement constitutes the entire agreement between the parties regarding the use of the Framework, replacing all previous oral or written agreements.  
9.2 If any term of this Agreement is deemed invalid or unenforceable, it shall not affect the validity of other terms.  
9.3 The Licensor's failure to exercise or delay in exercising its rights under this Agreement shall not be deemed a waiver of such rights.
