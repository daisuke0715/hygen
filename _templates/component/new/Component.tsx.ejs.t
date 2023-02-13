---
to: <%= abs_path %>/<%= component_name %>.tsx
---
import React from 'react';

<% if (have_props) { -%>
type Props = {

}
<%  } -%>

/**
 * << コンポーネントに関する説明コメントを記述してください。 >>
*/

const <%= component_name %>: <%- type_annotate %> = <%= props %> => {
  const test = '';
  
  return (
    <<%= tag %>>
    </<%= tag %>>
  );
}

export default <%= component_name %>;
