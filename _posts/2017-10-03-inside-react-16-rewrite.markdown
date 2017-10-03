---
title: “React 16: A look inside an API-compatible rewrite of our frontend UI library”
link: https://code.facebook.com/posts/1716776591680069/react-16-a-look-inside-an-api-compatible-rewrite-of-our-frontend-ui-library/?utm_source=reactnl&utm_medium=email
date: 2017-10-03T14:55:59+1100
---

> With today's release of React 16, we've completely rewritten the internals of React while keeping the public API essentially unchanged. From an engineering standpoint, it's a bit like swapping out the engine of a running car: since hundreds of other companies (including Facebook) use React in production every day, we wanted to do the swap without forcing people to rewrite their components built in React.
> 
> The new implementation is designed from the ground up to support asynchronous rendering, which allows processing large component trees without blocking the main execution thread. We also took the opportunity to build frequently-requested features that were previously difficult to add, like catching exceptions using error boundaries and returning multiple components from render. We've already spoken during the React Conf keynote in more detail about the motivation behind this rewrite, but we also wanted to bring developers behind the scenes to see how we actually built and tested this new implementation in the context of a large production app.

