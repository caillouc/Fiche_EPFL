---
title: Software security fiche
author: Pierre Colson
---

---

**Markdown** version on
[*github*](https://github.com/caillouc/Fiche_EPFL/blob/main/Software_security/Software_security.md?plain=1)  
Compiled using [*pandoc*](https://pandoc.org/) and [*`gpdf` script*](https://github.com/caillouc/dotfile/blob/linux/gpdf.sh)  

# General

* **Security** is the application and enforcement of *policies* through
  *mechanisms* over data and resources
  * *Policies* specify what we want to enforce
  * *Mechanisms* specify how we want to enfore the policies (i.e. an
    implementation/instance of a *policies*)
* **Software Security** is the area of Computer Science that focuses on testing,
  evaluating, improving, enforcing, and proving the security of software.
* A **Software bug** is an error, flaw, failure, or fault in a computer program
  or sytem that causes it to produce an incorrect or unexpected result, or to
  behave unintented ways. Bugs arise from mistakes made by people in either a
  program's source code or its design, in framworks and operating systems, and
  by compilers
* A vulnerability is a software weakness that allows an attacker to exploit a
  software bug
* Ethics
  * Black hat: Attack other systems for profit (illegal)
  * Grey hat: look out for your own benfit
  * White hat: Honest security professional


# Basics

## Basic security principles

* CIA Security triad
  * **Confidentiality** : an attacker cannot recover protected data
  * **Integrity**: an attacker cannot modify protected data
  * **Availability**: an attacker cannot stop/hider computation
  * Accountability/non-repudiation may be used as fourth fundamental concept: it
    prevents denial of message transmission or receipt
* The **Threat model** defines the abilities and resources of the attcker.
  Threat models enable structured reasoning about the attack surface
* Security is
  * expensive to develop
  * expensive to maintain
  * may have performance overhead
  * may be inconvinient to users
* Fundamental security mechanisms
  * **Isolation**: Isolate two components from each other. One component cannot
    acces data/code of the other component except through a well-defined API.
  * **Least privilege**: The principle of least privilege ensures that a
    component has the least privilege needed to function.
    * Any further removed privilege reduces functionality
    * Any added privilege will not increase functionality
    * This property constraints an attacker in the obtainable privilege
  * **Fault compartments**: Seperate individual components into smallest
    functional entity possible. These unit contain faults to individual
    components. Allow abstraction and permission checks at boundaries
  * **Trust and correctness**: Specific components are assumed to be trusted and
    correct according to a specification
* **Abstraction** is the act of representing essential features without
  including the background details or explenations. Abstraction allow an
  encapsulation of ideas without having to go into implementation details
* **OS abastraction**
  * *Single domain OS*
    * A single layer, no isolation or compartimentalization
    * All code runs in the same domain: the applcation can directly call into
      operating system drivers
    * High performance, ofter used in embedded systems
  * *Monolithic OS*
    * Two layers: the operating sytem and applications
    * The OS manages resources and orchestrates access
    * Applications are unprivileged, must request access from the OS
    * Linux fully and Windows mostly follows this approach for performance
      (isolating individual components is expensive)
  * *Micro Kernel*
    * Many layers: each component is a seperate process
    * Only essential parts are privileged
    * Applications request access from different OS process
  * *Library OS*
    * Few thin layers, flat struture
    * Micro-kernel exposes bare OS services
    * Each application brings all necessary OS components
* **Hardware abstraction**
  * Virtual memory through MMU/OS
  * Only OS has access to raw physical memory
  * DMA for trusted devices
  * ISA enforces provilege abstraction
  * Hardware abstractions are fundamental for performance
* **Access Control**
  * **Authentication** : Who are you ?
  * **Authorization** : Who has access to object
  * **Audit/Provenance** : I'll check what you did
* There are three fundamental type of **identification**
  * What you know : username, password
  * What you are : biometrics
  * What you have : smartcard, phone
* **Information Flow control** : Who can see what information ?
  * Access policies are called access control models
* Type of **access control**
  * **Mandatory Access Control** (MAC)
    * Rule and lattice-based policiy
    * Centrally controlled
    * One entity controls what permissions are given
    * Users cannot change policy themselves
    * Examples : The admin sets permissions for each file
    * Bell and LaPadula : *read down and write up* => enforces *condifentiality*
    * Biba : *read up and write down* => enforces *integrity*
  * **Discretionary Access Control** (DAC)
    * Object owner specificies policy
    * MAC requires central control, DAC empowers the user
    * User has authority over her resources
    * User sets permissions for ther data if other users wanc access
    * Examples : Unix Permissions
  * **Role-Based Access Control** (RBAC)
    * Policies defined in terms or roles (sets of permissions), individuals are
      assigned roles, roles are authorized for tasks.

## Secure software lifecycle

* **Secure software engineering**
  * Prevent loss/corruption of data
  * Prevent unauthorized access to data
  * Prevent unauthorized computation
  * Prevent escalation of privilege
  * Prevent downtime of resources
* **Secure development Cycle** (SDC)
  * **Requirement Analysis** : Define scope of a project and security/privacy
    boundatries. Define security specification, identify assets, asses
    environment, and specify use/abuse cases
    * **Threat Modeling** : threats, attack vector,  and emergency plans (i.e.
      how to react when things go wrong)
    * **Security requirements** : privacy policy, data management plan
    * **Third party dependencies** : define third party dependencies along with
      their update policies, risk analysis on dependencies
  * **Design** : the classic design phase focuses on functionality requirements.
    here we make security concerns an integral part of the analysis
    * Continuously **update threat model** as requirements change
    * **Secuity design review** : a major milestones, review security design and
      its interaction with functionality/requirements
    * **Design documentation** : up-to-date document of requirements and
      functionality with security assessments
  * **Implementation** : During implementaion, the design mau be slightly
    refined and the security documents must be updated accordingly along with
    continuous reviews and analysis
    * Continuous **code review** ensure software is built according to
      specification and checked for bugs
    * **Static analysis** ensures high code quality and highlights flaws
    * **Vulnerability scanning** of external dependencies for exploits
    * **Unit tests** ensure functionality/security across components
    * **Accountability** : use a source code/version control system
    * **Coding Standards** : assertions and documentation
    * **Continuous integration** : run unit tests, static analysis, and linter
      whenver code is checked in
  * **Testing** : Completed components are rigorously tested before they are
    finally integrated into the prototype
    * **Fuzzing** is a form of probabilistic test integration
    * **Dynamic analysis** complements fuzzing with heavy-weight tests based on
      symbolic execution and models
    * **Third party penetration testing** provides external validation and clean
      slate testing
  * **Release** : Before release of the final prorotype, verify the base
    assumptions from the initial requirements analysis and design
    * **Security review** : check for compliance of security properties
    * **Privacy review** : check for privacy policy complicance
    * **Review all licensing agreements**
  * **Maintenance** : Afte shipping software, continuously maintain security
    properties
    * **Track third party software** and update accordingly
    * **Provide vulnerability disclosure contacts** through, e.g. a bu bounty
      program or a least a public contact
    * **Regression testing** : whenever an update is deployed recheck security
      and functionality requirements
    * **Deploy updates securly**

# Policies and Attacks

## Security prolicies

* A **policiy** is a deliberate system of principle to guide decisions and
  achieve rational outcomes. A policy is a statment of intent, and is
  implemented as a procedure of protocol.
* **Isolation** is the process or fact of isolating  or being isolated. Two
  components are isolated if their intercations are resitrited.
* **Least privilege** ensures that each components has the minimal amount of
  privileges to function. If any privilege is removed, the component stops
  working
* **Compartmentalization** General technique of separating two more parts of a
  system to prevent malfunctions from spreading between or amoung them
  * Requires combination of isolation and least privilege
  * String policy to contain faults to single components
* **Memory safety** is a property that ensures that all memory accesses adhere
  to the semantics defined by the source programming language
  * Memory unsafe languages like C/C++ cannot enforce memory safety. Data
    accesses can occur through stale/illegal pointers
  * Memory safety prohibits buffer overflows, NULL pointer dereferences, use
    after free, use of uninitialized memory, or double free
  * A program is memoryy safe, if all possible excecutions of the program are
    memory safe
  * Runtime environment is memory safe, if all runnable programs are memory safe
  * A programming language is memory safe, if all expressible programs are
    memory safe
* Every memory safety is a bug
* A bug who's input can be attacker-controlled is a vulnerability
* The goals of the attack depends on your threat model
* **Memory safety violation** rely in two steps
  * Pointer foes out of bound or become dangling
  * The pointer is deferenced (used for read or write)
* **Spacial memory safety** is a property that ensures that all memory
  dereferences are within boudns of their pointer's valid object.
* **Temporal memory safety** is a property that ensures that all memory
  dereferences are vamid at the time of the dereference
* Policies defferences
  * **Object based** policies strore metadata (size, location) for each
    allocated object (none for pointer)
    * Allow you to check if an access targets a valid object
    * Cannot distinguish different pointers
    * Trade lower security for lower overhead
  * **Pointer based** polices strore metadata for each pointers
    * Allow you to verify if each access is correct for each pointer
 * C/C++ **softbound** : compiler based instrumentation to enforce memory safety
   for C/C++
   * Initialize(disjoint) metadata for pointer when it is assigned
   * Assignment covers both creation of pointers and propgation
   * Check bounds whenever pointer is dereferenced
* Temporal memory safety is orthogonal to spacial memory safety
  * The same memory area can be allocated to new object

* **CETS** leverages memory object versioning. Each allocated memory object and
  pointer is assigned a unique version. Upon dereference, check if the pointer
  version is equal to the version of the memory object
  * Two failure versions
    * Area was deallocated and version is smaller
    * Are was reallocated to new object and the vesion is larger
* **Type safe** code accessed only the memory locations it is authorized to
  access.

## Software bugs

* **Attack primitive** are building blocks for exploits
* Software bugs map to attack primitives
* A chain of attack primitive results in an **exploit**, the underlying bugs of
  the attack primitives become vunlnerabilites
> nothing more in the slides ...

## Attack vectors

* **Denial of service** (DoS): Prohibit legit use of a service by either causing
  abnormal service termination or overwhelming the service with a large number
  of duplicate/unnecessary requests so that legit requests can no longer be
  served
* **Leak information**: An abnormal transfer of sensitive information to the
  attacker. An information leak abuses an illegal, implicit, or unintended
  transfer of information to pass sensitive data to the attacker who should not
  have access to that data
  * Outout sensitive data
* **Code execution** allows the attacker to break out the restricted computation
  available through the application and execute arbitrary code instead. This can
  be achieved by (i) injecting new code, or (ii) repurposing existing code
  through different means
  * **Control flow Hijacking** is attack primitive that allows the adversary to
    redirect control flow to locations that would not be reached in a benign
    execution. It requires :
    * Knowledge of the location of the code pointer
    * Knowledge of the code target
    *  Existing code and control flow must be use the compromised pointer
  * **Code injection**: Instead of modifyign/overwriting code, inject new code
    into the address space of the process. It requites : 
    * Knowledge of the location of a writable memory area
    * Memory area must be executable 
    * Control flow must be hijacked/redirected to injected code 
    * Contruction of shellcode 
    * Code can be injected either on the *heap* or on the *stack*
  * **Code reuse**: Instead of injecting code, reuse code of the program. The
    main idea is to stitch together existing code snippets to execute new
    arbitrary behavior. It requires : 
    * Knowledge of a writable memorry area that contains invocation frames
    * Knowledge of executable code snippets
    * Control flow must be hijacked/redirected to prepared invocation frames
    * Contruction of ROP payload
  * **Data corruption**: This attack vector locates existing code and modifies
    it to execute the attacker's computation. It requires : 
    * Knowledge of the code location 
    * Area must be writable 
    * Program must execute that code on benign code path
  * Code execution requires control over control flow
    * Attacker must overwrite a code pointer
    * Force program to dereference corrupted code pointer
* **Privilege excalation**: An unintended escalation (increase) of privileges.
  An attacker gains higher privileges in an unintended way. An example of
  privilege escalation is gaining administrator privileges through a kernel bug
  or a bug in a privileged program. A common example is setting the `is_admin`
  flag.
* Low level attacks start with a memory or type safety violation
* Accessing out-of-bounds violates **spacial memory safety**
* Accessing reclaimed object violates **temporal memory safety**
* Casting object into incompatible type violates **type safety**
* "*Writing shellcode is an art*"
* **Format string** are highly versatile, resulting in a flexible exploitation
  * Code injection: place shell code in string itself 
  * Code reuse: encode fixed gadget offsets and invocation frames
  * Advanced code reuse: recover gadget offsets, then encode them on-the-fly
* **Type confusion attacks**
  * Control two pointers of different types ot single memory area 
  * Different interpretation of fields leads to "opportunities"

# Stopping Exploitation

## Mitigations

## Advanced mitigations

# Fiding bugs

## Testing

## Sanitizer

# Case study ?

## Browser security

## Web security

## Modbile Security

# Summaries

* **Basis Security principles**
  * Sofware security goal: allow intended use of software, prevent unintented
    use that may cause harm
  * Security triad : Condidentiality, Integrity, Availability
  * Security of a system depends on its thread model
  * Concepts: isolation, least privilege, fault compartments, trust
  * Security relies on abstractions to reduce complexity
* **Secure software lifecycle**
  * Secure software development enforces security principles during software
    development
  * Software lives and evolves
  * Security must be first class citizen
    * Secure Requirements/specification
    * Security-aware Design (Threats?)
    * Secure Implementation (Reviews?)
    * Testing
    * Updates and patching
* **Security prolicies**
  * Security policies against specific attack vectors
  * Generic policies: isolation, least provileges, compartimentalization
  * Runtime policies : memory and type safety
  * Memory and type safety bugs are root cause of vulnerabilities
  * Memory safety: distinguish between spacial and temporal memory safety
    violations
    * Softbound: spacial memory safety, disjoint pointer metadata
    * CETS: temporal memory safety through versioning
  * Type sfae code accesses only the memory locations it is authorized to access
    * HexType: keep per object type metadata, explicit cast checks
  * Softbound, CETS, and Hextype are sanitizers: they trade performance for
    correctness during development
* **Software bugs**
  * Memory safety bugs allow state modification  
    * Spacial memory safety focuses on bounds
    * Temporal memory safety focuses on validity
  * Type safety ensures that objects have the correct type
  * Large amounts of bug classes lead to *fun* vulnerabilities
* **Attack vectors**
  * Work with constrained resources (buffer size, limited control, limited
    information, partial leaks)
  * Control environment: write sehllcode or prepare gadget invocation frames
  * Execute outside ot eh defined program semantics
  * Attack vectors
    * Code injection (plus control flow hijacking)
    * Code reuse (plus control flow hijacking)
    * Heap versus stack 

