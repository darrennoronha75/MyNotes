
Solutions for FOL translation problems from Exam SoSe 24.

### Question: "Berlin and Hamburg are both in Germany"
* **Strategy**: This is a conjunction of two specific ground facts.
* **Logic**: $In(Berlin, Germany) \wedge In(Hamburg, Germany)$.
* *Common Error*: $In(Berlin \wedge Hamburg, Germany)$ is syntactically invalid.

### Question: "There is a country that borders both France and Germany"
* **Strategy**: Use $\exists$ with $\wedge$.
* **Logic**: $\exists c, Country(c) \wedge Border(c, France) \wedge Border(c, Germany)$.

### Question: "All countries that border Germany are in Europe"
* **Strategy**: Use $\forall$ with $\Rightarrow$.
* **Logic**: $\forall c, (Country(c) \wedge Border(c, Germany)) \Rightarrow In(c, Europe)$.

### Links
* **Guide**: [[_FOL Translation Guide_]]
* **Base**: [[Quantifiers]]