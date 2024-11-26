local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node

local snippets = {
    snip({
        trig = "npage",
        namr = "Next.js Page",
        dscr = "Create a new Next.js page component",
    }, {
        text("export default function "), insert(1, "PageName"), text("() {"),
        text({"", "  return ("}),
        text({"", '    <div className="p-24">'}),
        text({"", '      <h1 className="text-3xl font-bold mb-4">'}), func(function(args) return args[1][1] end, {1}), text("</h1>"),
        text({"", "      <p>"}), insert(2, "Page content goes here"), text("</p>"),
        text({"", "    </div>"}),
        text({"", "  )"}),
        text({"", "}"}),
    }),

    snip({
        trig = "nlink",
        namr = "Next.js Link",
        dscr = "Create a Next.js Link component",
    }, {
        text({"import Link from 'next/link'", "", ""}),
        text('<Link href="'), insert(1, "/path"), text('" className="text-blue-500 hover:underline">'),
        text({"", "  "}), insert(2, "Link Text"),
        text({"", "</Link>"}),
    }),

    snip({
        trig = "tflex",
        namr = "Tailwind Flex Container",
        dscr = "Create a Tailwind CSS flex container",
    }, {
        text('<div className="flex '),
        choice(1, {
            text("items-center"),
            text("items-start"),
            text("items-end")
        }),
        text(" "),
        choice(2, {
            text("justify-between"),
            text("justify-center"),
            text("justify-start"),
            text("justify-end")
        }),
        text(" "), insert(3, "p-4"), text('">'),
        text({"", "  "}), insert(0),
        text({"", "</div>"}),
    }),

    snip({
        trig = "tbtn",
        namr = "Tailwind Button",
        dscr = "Create a Tailwind CSS styled button",
    }, {
        text('<button className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition-colors">'),
        text({"", "  "}), insert(1, "Button Text"),
        text({"", "</button>"}),
    }),

    snip({
        trig = "napi",
        namr = "Next.js API Route",
        dscr = "Create a Next.js API route",
    }, {
        text({"import { NextApiRequest, NextApiResponse } from 'next'", "", ""}),
        text("export default async function handler(req: NextApiRequest, res: NextApiResponse) {"),
        text({"", "  if (req.method === 'GET') {"}),
        text({"", "    // Handle GET request"}),
        text({"", "    res.status(200).json({ message: 'Hello from API' })"}),
        text({"", "  } else {"}),
        text({"", "    // Handle any other HTTP method"}),
        text({"", "    res.setHeader('Allow', ['GET'])"}),
        text({"", "    res.status(405).end(`Method ${req.method} Not Allowed`)"}),
        text({"", "  }"}),
        text({"", "}"}),
    }),

    snip({
        trig = "nlayout",
        namr = "Next.js Layout",
        dscr = "Create a Next.js layout component",
    }, {
        text({"import { ReactNode } from 'react'", "", ""}),
        text("export default function "), insert(1, "LayoutName"), text("({ children }: { children: ReactNode }) {"),
        text({"", "  return ("}),
        text({"", "    <div>"}),
        text({"", "      <header>"}), insert(2, "Header content"), text("</header>"),
        text({"", "      <main>{children}</main>"}),
        text({"", "      <footer>"}), insert(3, "Footer content"), text("</footer>"),
        text({"", "    </div>"}),
        text({"", "  )"}),
        text({"", "}"}),
    }),


    snip({
        trig = "useS",
        namr = "useState Hook",
        dscr = "Create a useState hook",
    }, {
        text("const ["), insert(1, "state"), text(", set"), func(function(args) return args[1][1]:gsub("^%l", string.upper) end, {1}), text("] = useState("), insert(2, "initialState"), text(");"),
    }),

    snip({
        trig = "useE",
        namr = "useEffect Hook",
        dscr = "Create a useEffect hook",
    }, {
        text({"useEffect(() => {", "  "}), insert(1),
        text({"", "}, ["}), insert(2), text("]);"),
    }),

    snip({
        trig = "nimg",
        namr = "Next.js Image Component",
        dscr = "Create a Next.js Image component",
    }, {
        text({"import Image from 'next/image'", "", ""}),
        text('<Image src="'), insert(1, "/path/to/image.jpg"), text('" alt="'), insert(2, "Image description"), text('" '),
        text("width={"), insert(3, "500"), text("} height={"), insert(4, "300"), text("} />"),
    }),

    snip({
        trig = "nform",
        namr = "Next.js Form with handleSubmit",
        dscr = "Create a form with handleSubmit function in Next.js",
    }, {
        text({"import { FormEvent } from 'react'", "", ""}),
        text("const handleSubmit = (e: FormEvent<HTMLFormElement>) => {"),
        text({"  e.preventDefault()", "  // Handle form submission", "}", "", ""}),
        text('<form onSubmit={handleSubmit} className="space-y-4">'),
        text({"  "}), insert(0),
        text({"  <button type=\"submit\" className=\"px-4 py-2 bg-blue-500 text-white rounded\">Submit</button>"}),
        text({"</form>"}),
    }),
}

return {
    typescript = snippets,
    typescriptreact = snippets,
    javascript = snippets,
    javascriptreact = snippets,
}

